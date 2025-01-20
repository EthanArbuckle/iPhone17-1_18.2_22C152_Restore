@interface MSMediaStreamDaemon
- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 outError:(id *)a5;
- (BOOL)enqueueAssetCollection:(id)a3 personID:(id)a4 outError:(id *)a5;
- (BOOL)hasOutstandingActivity;
- (BOOL)isInRetryState;
- (BOOL)mayDownloadPersonID:(id)a3;
- (BOOL)personIDHasOutstandingPublications:(id)a3;
- (MSMediaStreamDaemon)init;
- (MSMediaStreamDaemonDelegate)delegate;
- (id)_boundDeleterForPersonID:(id)a3;
- (id)_boundPublisherForPersonID:(id)a3;
- (id)_boundServerSideConfigManagerForPersonID:(id)a3;
- (id)_boundSubscriberForPersonID:(id)a3;
- (id)nextActivityDate;
- (id)ownSubscribedStreamForPersonID:(id)a3;
- (id)serverSideConfigurationForPersonID:(id)a3;
- (id)subscribedStreamsForPersonID:(id)a3;
- (void)abortAllActivityForPersonID:(id)a3;
- (void)computeHashForAsset:(id)a3 personID:(id)a4;
- (void)deleteAssetCollections:(id)a3 forPersonID:(id)a4;
- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4;
- (void)didIdle;
- (void)didReceiveAuthenticationFailureForPersonID:(id)a3;
- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3;
- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3;
- (void)didReceiveServerSideConfigurationVersion:(id)a3 forPersonID:(id)a4;
- (void)didUnidle;
- (void)forgetPersonID:(id)a3;
- (void)pollForSubscriptionUpdatesForPersonID:(id)a3;
- (void)pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:(id)a3;
- (void)reenqueueQuarantinedActivitiesWithReason:(id)a3;
- (void)refreshServerSideConfigurationForPersonID:(id)a3;
- (void)resetSubscriberSyncForPersonID:(id)a3;
- (void)retryOutstandingActivities;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)stop;
- (void)stopAllActivities;
@end

@implementation MSMediaStreamDaemon

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSMediaStreamDaemonDelegate *)a3;
}

- (MSMediaStreamDaemonDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)mayDownloadPersonID:(id)a3
{
  return 1;
}

- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    id v7 = a3;
    __int16 v8 = 2114;
    id v9 = a4;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Received quota excess failure for person ID %@. Next retry date: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = a3;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Successfully authenticated person ID %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didReceiveAuthenticationFailureForPersonID:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = a3;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Received authentication failure for person ID %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stop
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Media stream daemon stopping.", buf, 2u);
  }
  context = (void *)MEMORY[0x1E019E3B0]([(MSMediaStreamDaemon *)self stopAllActivities]);
  v3 = +[MSPublisher _clearInstantiatedPublishersByPersonID];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v23;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = [v3 objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * v7)];
        id v9 = [v8 delegate];
        if (v9)
        {
          if (objc_opt_respondsToSelector()) {
            [v9 publisherWillDeassignPluginAsDelegateOfPublisher:v8];
          }
          [v8 setDelegate:0];
          [(NSCountedSet *)self->_retainedObjects removeObject:v9];
        }
        [v8 deactivate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v5);
  }
  uint64_t v10 = +[MSSubscriber _clearInstantiatedSubscribersByPersonID];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [v10 objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v14)];
        v16 = [v15 delegate];
        if (v16)
        {
          if (objc_opt_respondsToSelector()) {
            [v16 subscriberWillDeassignPluginAsDelegateOfSubscriber:v15];
          }
          [v15 setDelegate:0];
          [(NSCountedSet *)self->_retainedObjects removeObject:v16];
        }
        [v15 deactivate];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
    }
    while (v12);
  }
}

- (void)start
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Media stream daemon starting...", buf, 2u);
  }
  dispatch_time_t v3 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MSMediaStreamDaemon_start__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E4F14428], block);
}

void __28__MSMediaStreamDaemon_start__block_invoke(uint64_t a1)
{
  v2 = MSPlatform();
  dispatch_time_t v3 = (void *)[v2 subscriberPluginClass];

  id v5 = [v3 personIDForPollingTriggeredByPushNotification];
  if ([v5 length])
  {
    [*(id *)(a1 + 32) retainBusy];
    uint64_t v4 = [*(id *)(a1 + 32) _boundSubscriberForPersonID:v5];
    [v4 checkForNewAssetCollectionsIfMissingCtag];
    [*(id *)(a1 + 32) releaseBusy];
    [*(id *)(a1 + 32) retryOutstandingActivities];
  }
}

- (void)deleteAssetCollections:(id)a3 forPersonID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MSDaemon *)self retainBusy];
  id v8 = [(MSMediaStreamDaemon *)self _boundDeleterForPersonID:v6];

  [v8 deleteAssetCollections:v7];
  [(MSDaemon *)self releaseBusy];
}

- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Sending local notification about new server-side configuration for %@", buf, 0xCu);
  }
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v4, @"personID", 0);
  [v5 postNotificationName:@"MSMSDServerSideConfigurationDidChangeNotification" object:self userInfo:v6];
}

- (void)refreshServerSideConfigurationForPersonID:(id)a3
{
  id v3 = [(MSMediaStreamDaemon *)self _boundServerSideConfigManagerForPersonID:a3];
  [v3 refreshConfiguration];
}

- (void)didReceiveServerSideConfigurationVersion:(id)a3 forPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSMediaStreamDaemon *)self serverSideConfigurationForPersonID:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectForKey:@"mme.streams.application.configVersion"];
    uint64_t v11 = v10;
    if (v6)
    {
      char v12 = [v6 isEqualToString:v10];

      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Not refreshing server-side configuration.", buf, 2u);
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Server-side configuration has changed. Refreshing configuration.", buf, 2u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__MSMediaStreamDaemon_didReceiveServerSideConfigurationVersion_forPersonID___block_invoke;
  v13[3] = &unk_1E6C3DB28;
  v13[4] = self;
  id v14 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

LABEL_10:
}

uint64_t __76__MSMediaStreamDaemon_didReceiveServerSideConfigurationVersion_forPersonID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshServerSideConfigurationForPersonID:*(void *)(a1 + 40)];
}

- (id)serverSideConfigurationForPersonID:(id)a3
{
  id v3 = [(MSMediaStreamDaemon *)self _boundServerSideConfigManagerForPersonID:a3];
  id v4 = [v3 config];

  return v4;
}

- (id)ownSubscribedStreamForPersonID:(id)a3
{
  id v3 = [(MSMediaStreamDaemon *)self _boundSubscriberForPersonID:a3];
  id v4 = [v3 ownSubscribedStream];

  return v4;
}

- (id)subscribedStreamsForPersonID:(id)a3
{
  id v3 = [(MSMediaStreamDaemon *)self _boundSubscriberForPersonID:a3];
  id v4 = [v3 subscribedStreams];

  return v4;
}

- (void)computeHashForAsset:(id)a3 personID:(id)a4
{
  id v6 = a3;
  id v7 = [(MSMediaStreamDaemon *)self _boundPublisherForPersonID:a4];
  [v7 computeHashForAsset:v6];
}

- (void)resetSubscriberSyncForPersonID:(id)a3
{
  id v3 = [(MSMediaStreamDaemon *)self _boundSubscriberForPersonID:a3];
  [v3 resetSync];
}

- (void)pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MSDaemon *)self retainBusy];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    uint64_t v10 = self;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Push notification received for My Photo Stream with targetPersonID %@.", (uint8_t *)&v9, 0x16u);
  }
  id v5 = MSPlatform();
  id v6 = (void *)[v5 subscriberPluginClass];

  id v7 = [v6 personIDForPollingTriggeredByPushNotification];
  if ([v7 length])
  {
    int v8 = [v7 isEqualToString:v4];
    if (!v4 || v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        int v9 = 138543362;
        uint64_t v10 = self;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Serving push notification", (uint8_t *)&v9, 0xCu);
      }
      [(MSMediaStreamDaemon *)self didReceivePushNotificationForPersonID:v7];
      [(MSMediaStreamDaemon *)self pollForSubscriptionUpdatesForPersonID:v7];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "The subscription plugin class does not support push notification refreshing.", (uint8_t *)&v9, 2u);
  }
  [(MSDaemon *)self releaseBusy];
}

- (void)pollForSubscriptionUpdatesForPersonID:(id)a3
{
  id v4 = a3;
  [(MSDaemon *)self retainBusy];
  id v5 = [(MSMediaStreamDaemon *)self _boundSubscriberForPersonID:v4];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MSMediaStreamDaemon_pollForSubscriptionUpdatesForPersonID___block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
  [(MSDaemon *)self releaseBusy];
}

uint64_t __61__MSMediaStreamDaemon_pollForSubscriptionUpdatesForPersonID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForNewAssetCollections];
}

- (BOOL)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(MSDaemon *)self retainBusy];
  uint64_t v10 = [(MSMediaStreamDaemon *)self _boundPublisherForPersonID:v9];

  if (v10)
  {
    LOBYTE(a5) = [v10 dequeueAssetCollectionWithGUIDs:v8 outError:a5];
  }
  else if (a5)
  {
    __int16 v11 = (void *)MEMORY[0x1E4F28C58];
    id v12 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUBLISHER_MISSING");
    *a5 = [v11 MSErrorWithDomain:@"MSPublisherErrorDomain" code:9 description:v12];

    LOBYTE(a5) = 0;
  }
  [(MSDaemon *)self releaseBusy];

  return (char)a5;
}

- (BOOL)enqueueAssetCollection:(id)a3 personID:(id)a4 outError:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  [(MSDaemon *)self retainBusy];
  uint64_t v10 = [(MSMediaStreamDaemon *)self _boundPublisherForPersonID:v8];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__MSMediaStreamDaemon_enqueueAssetCollection_personID_outError___block_invoke;
  block[3] = &unk_1E6C3DA38;
  id v14 = v10;
  id v11 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
  LOBYTE(a5) = [v11 enqueueAssetCollections:v9 outError:a5];

  [(MSDaemon *)self releaseBusy];
  return (char)a5;
}

uint64_t __64__MSMediaStreamDaemon_enqueueAssetCollection_personID_outError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

- (void)forgetPersonID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Forgetting everything about person ID %@...", (uint8_t *)&v12, 0xCu);
  }
  +[MSPublisher forgetPersonID:v3];
  +[MSSubscriber forgetPersonID:v3];
  +[MSDeleter forgetPersonID:v3];
  +[MSServerSideConfigManager forgetPersonID:v3];
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = MSPathPublishDirForPersonID(v3);
  [v4 removeItemAtPath:v5 error:0];

  id v6 = MSPathPublishMMCSLibraryForPersonID(v3);
  [v4 removeItemAtPath:v6 error:0];

  id v7 = MSPathSubscribeDirForPersonID(v3);
  [v4 removeItemAtPath:v7 error:0];

  id v8 = MSPathSubscribeMMCSLibraryForPersonID(v3);
  [v4 removeItemAtPath:v8 error:0];

  id v9 = MSPathShareDirForPersonID(v3);
  [v4 removeItemAtPath:v9 error:0];

  uint64_t v10 = MSPathDeleteDirForPersonID(v3);
  [v4 removeItemAtPath:v10 error:0];

  id v11 = MSPathConfigDirForPersonID(v3);
  [v4 removeItemAtPath:v11 error:0];

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Person ID %@ forgotten.", (uint8_t *)&v12, 0xCu);
  }
}

- (void)stopAllActivities
{
  +[MSPublisher stopAllActivities];
  +[MSSubscriber stopAllActivities];
  +[MSDeleter stopAllActivities];
  +[MSServerSideConfigManager abortAllActivities];
}

- (void)abortAllActivityForPersonID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Aborting all activities for person ID %@.", (uint8_t *)&v8, 0xCu);
  }
  id v4 = +[MSPublisher existingPublisherForPersonID:v3];
  [v4 abort];

  id v5 = +[MSSubscriber existingSubscriberForPersonID:v3];
  [v5 abort];

  id v6 = +[MSDeleter existingDeleterForPersonID:v3];
  [v6 abort];

  id v7 = +[MSServerSideConfigManager existingConfigManagerForPersonID:v3];
  [v7 abort];
}

- (void)reenqueueQuarantinedActivitiesWithReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MSDaemon *)self retainBusy];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Reenqueuing quarantined activities. Reason: %{public}@.", buf, 0x16u);
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = +[MSPublisher personIDsWithOutstandingActivities];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(MSMediaStreamDaemon *)self _boundPublisherForPersonID:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        [v10 reenqueueQuarantinedAssetCollections];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(MSDaemon *)self releaseBusy];
}

- (void)retryOutstandingActivities
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [(MSDaemon *)self retainBusy];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v3 = +[MSPublisher personIDsWithOutstandingActivities];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v42;
    uint64_t v7 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [(MSMediaStreamDaemon *)self _boundPublisherForPersonID:*(void *)(*((void *)&v41 + 1) + 8 * v8)];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke;
        block[3] = &unk_1E6C3DA38;
        id v40 = v9;
        id v10 = v9;
        dispatch_async(v7, block);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v5);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v11 = +[MSSubscriber personIDsWithOutstandingActivities];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    v15 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = [(MSMediaStreamDaemon *)self _boundSubscriberForPersonID:*(void *)(*((void *)&v35 + 1) + 8 * v16)];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_2;
        v33[3] = &unk_1E6C3DA38;
        id v34 = v17;
        id v18 = v17;
        dispatch_async(v15, v33);

        ++v16;
      }
      while (v13 != v16);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v13);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = +[MSDeleter personIDsWithOutstandingActivities];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v30;
    long long v23 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v25 = [(MSMediaStreamDaemon *)self _boundDeleterForPersonID:*(void *)(*((void *)&v29 + 1) + 8 * v24)];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_3;
        v27[3] = &unk_1E6C3DA38;
        id v28 = v25;
        id v26 = v25;
        dispatch_async(v23, v27);

        ++v24;
      }
      while (v21 != v24);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v21);
  }

  [(MSDaemon *)self releaseBusy];
}

uint64_t __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) publish];
}

uint64_t __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkForOutstandingActivities];
}

uint64_t __49__MSMediaStreamDaemon_retryOutstandingActivities__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) performOutstandingActivities];
}

- (id)_boundServerSideConfigManagerForPersonID:(id)a3
{
  uint64_t v4 = +[MSServerSideConfigManager configManagerForPersonID:a3];
  [v4 setDaemon:self];
  return v4;
}

- (id)_boundDeleterForPersonID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MSDeleter deleterForPersonID:v4];
  uint64_t v6 = [v5 delegate];

  if (v6)
  {
LABEL_2:
    id v7 = v5;
    goto LABEL_11;
  }
  uint64_t v8 = MSPlatform();
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = MSPlatform();
    long long v11 = (void *)[v10 deletePluginClass];

    uint64_t v12 = [v11 deleterPluginForPersonID:v4];
    if (v12)
    {
      uint64_t v13 = (void *)v12;
      [(NSCountedSet *)self->_retainedObjects addObject:v12];
      if (objc_opt_respondsToSelector()) {
        [v13 deleterWillAssignPluginAsDelegateOfDeleter:v5];
      }
      [v5 setDelegate:v13];
      [v5 setDaemon:self];

      goto LABEL_2;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v15 = 134218242;
      id v16 = v4;
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get deleter plugin, person id %p, plugin class %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v7 = 0;
LABEL_11:

  return v7;
}

- (id)_boundSubscriberForPersonID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MSSubscriber subscriberForPersonID:v4];
  uint64_t v6 = [v5 delegate];

  if (v6)
  {
LABEL_6:
    id v11 = v5;
    goto LABEL_7;
  }
  id v7 = MSPlatform();
  uint64_t v8 = (void *)[v7 subscriberPluginClass];

  uint64_t v9 = [v8 subscriberPluginForPersonID:v4];
  if (v9)
  {
    id v10 = (void *)v9;
    [(NSCountedSet *)self->_retainedObjects addObject:v9];
    if (objc_opt_respondsToSelector()) {
      [v10 subscriberWillAssignPluginAsDelegateOfSubscriber:v5];
    }
    [v5 setDelegate:v10];
    [v5 setDaemon:self];

    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 134218242;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get subscriber plugin, person id %p, plugin class %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = 0;
LABEL_7:

  return v11;
}

- (id)_boundPublisherForPersonID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[MSPublisher publisherForPersonID:v4];
  uint64_t v6 = [v5 delegate];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = MSPlatform();
  uint64_t v8 = (void *)[v7 publisherPluginClass];

  uint64_t v9 = [v8 publisherPluginForPersonID:v4];
  if (v9)
  {
    id v10 = (void *)v9;
    [(NSCountedSet *)self->_retainedObjects addObject:v9];
    [v10 publisherWillAssignPluginAsDelegateOfPublisher:v5];
    [v5 setDelegate:v10];
    [v5 setDaemon:self];

LABEL_4:
    id v11 = v5;
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v13 = 134218242;
    id v14 = v4;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get publisher plugin, person id %p, plugin class %{public}@", (uint8_t *)&v13, 0x16u);
  }
  id v11 = 0;
LABEL_5:

  return v11;
}

- (void)didUnidle
{
  id v3 = [(MSMediaStreamDaemon *)self delegate];
  [v3 mediaStreamDaemonDidUnidle:self];
}

- (void)didIdle
{
  id v3 = [(MSMediaStreamDaemon *)self delegate];
  [v3 mediaStreamDaemonDidIdle:self];
}

- (BOOL)isInRetryState
{
  if (+[MSPublisher isInRetryState]
    || +[MSSubscriber isInRetryState])
  {
    return 1;
  }
  return +[MSDeleter isInRetryState];
}

- (BOOL)personIDHasOutstandingPublications:(id)a3
{
  id v3 = a3;
  id v4 = +[MSPublisher personIDsWithOutstandingActivities];
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (BOOL)hasOutstandingActivity
{
  v2 = [(MSMediaStreamDaemon *)self nextActivityDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)nextActivityDate
{
  v2 = +[MSPublisher nextActivityDate];
  BOOL v3 = +[MSSubscriber nextActivityDate];
  if (v3 && (!v2 || [v2 compare:v3] == 1))
  {
    id v4 = v3;

    v2 = v4;
  }
  char v5 = +[MSDeleter nextActivityDate];
  if (v5 && (!v2 || [v2 compare:v5] == 1))
  {
    id v6 = v5;

    v2 = v6;
  }
  id v7 = v2;

  return v7;
}

- (MSMediaStreamDaemon)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSMediaStreamDaemon;
  v2 = [(MSDaemon *)&v6 init];
  if (v2)
  {
    BOOL v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    retainedObjects = v2->_retainedObjects;
    v2->_retainedObjects = v3;
  }
  return v2;
}

@end