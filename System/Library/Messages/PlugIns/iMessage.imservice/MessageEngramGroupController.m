@interface MessageEngramGroupController
+ (id)sharedInstance;
- (BOOL)_createGroupForExistingChat:(id)a3;
- (id)IDSServerBagiMessageSharedInstance;
- (id)_URIsForChatParticipants:(id)a3 fromID:(id)a4;
- (id)_URIsFromApplicationData:(id)a3;
- (id)_callerURIForChat:(id)a3;
- (id)_createApplicationDataForDestinations:(id)a3;
- (id)applicationDataDictionary:(id)a3;
- (id)lockDownManager;
- (int64_t)_daysToWaitBeforeCreatingEngroup;
- (void)_addRemoveParticipantsToENGroupForChat:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromID:(id)a7 attemptCount:(unint64_t)a8 completion:(id)a9;
- (void)_checkAndSetUpContext:(id)a3;
- (void)_createEngramGroupForChat:(id)a3 fromID:(id)a4 service:(id)a5 completion:(id)a6;
- (void)_createGroupFromGroupContext:(id)a3 chat:(id)a4 enparticipants:(id)a5 destinations:(id)a6 completion:(id)a7;
- (void)_createParticipantsAndUpdateGroup:(id)a3 addParticipantsURIs:(id)a4 removeParticipantURIs:(id)a5 fromID:(id)a6 service:(id)a7 completion:(id)a8;
- (void)_enparticipantsForDestinations:(id)a3 completion:(id)a4;
- (void)_updateGroupWithParticipants:(id)a3 chat:(id)a4 service:(id)a5 participants:(id)a6 destinations:(id)a7 completion:(id)a8;
- (void)_updateLocalParticipantsFromEngroup:(id)a3 chat:(id)a4 fromID:(id)a5;
- (void)addParticipantsToENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7;
- (void)convergeOnIncomingGroup:(id)a3 chat:(id)a4 service:(id)a5;
- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5;
- (void)lookUpENGroupForChat:(id)a3 service:(id)a4 completion:(id)a5;
- (void)removeParticipantsFromENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7;
- (void)sendMessageWithEngram:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 fromAccount:(id)a7 session:(id)a8 context:(id)a9 groupController:(id)a10 completionBlock:(id)a11;
@end

@implementation MessageEngramGroupController

- (id)IDSServerBagiMessageSharedInstance
{
  return +[IDSServerBag sharedInstanceForBagType:1];
}

- (id)lockDownManager
{
  return +[IMLockdownManager sharedInstance];
}

+ (id)sharedInstance
{
  if (qword_EC508 != -1) {
    dispatch_once(&qword_EC508, &stru_DF1B8);
  }
  return (id)qword_EC520;
}

- (void)_checkAndSetUpContext:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_67264;
  v3[3] = &unk_DF1E0;
  v3[4] = a3;
  v3[5] = self;
  if (qword_EB410 != -1) {
    dispatch_once(&qword_EB410, v3);
  }
}

- (void)lookUpENGroupForChat:(id)a3 service:(id)a4 completion:(id)a5
{
  id v9 = objc_msgSend(objc_msgSend(a3, "engramID"), "__im_engramDataRepresentation");
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_673F8;
    v11[3] = &unk_DF280;
    v11[4] = self;
    v11[5] = v9;
    v11[6] = a3;
    v11[7] = a5;
    [a4 performGroupTask:v11];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = [a3 engramID];
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Couldn't create a valid NSData for engramid: %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void, NSError *))a5 + 2))(a5, 0, 0, +[NSError errorWithDomain:EngramControllerErrorDomain code:3 userInfo:0]);
  }
}

- (void)addParticipantsToENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7
{
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "We are explicitly adding these participants: %@", buf, 0xCu);
    }
  }
  [(MessageEngramGroupController *)self _addRemoveParticipantsToENGroupForChat:a4 participantsToAdd:a3 participantsToRemove:0 service:a5 fromID:a6 attemptCount:0 completion:a7];
}

- (void)removeParticipantsFromENGroup:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 completion:(id)a7
{
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "We are explicitly removing these participants: %@", buf, 0xCu);
    }
  }
  [(MessageEngramGroupController *)self _addRemoveParticipantsToENGroupForChat:a4 participantsToAdd:0 participantsToRemove:a3 service:a5 fromID:a6 attemptCount:0 completion:a7];
}

- (void)sendMessageWithEngram:(id)a3 chat:(id)a4 service:(id)a5 fromID:(id)a6 fromAccount:(id)a7 session:(id)a8 context:(id)a9 groupController:(id)a10 completionBlock:(id)a11
{
  if (objc_msgSend(objc_msgSend(a4, "engramID"), "length"))
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = a4;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Looking up engram group for chat: %@", buf, 0xCu);
      }
    }
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_67C04;
    v22[3] = &unk_DF2D0;
    v22[11] = a5;
    v22[12] = a11;
    v22[4] = a4;
    v22[5] = a10;
    v22[6] = a3;
    v22[7] = a6;
    v22[8] = a7;
    v22[9] = a9;
    v22[10] = self;
    [(MessageEngramGroupController *)self lookUpENGroupForChat:a4 service:a5 completion:v22];
  }
  else if (([a4 createEngramGroupOnMessageSend] & 1) != 0 {
         || objc_msgSend(objc_msgSend(a4, "groupID"), "length")
  }
         && [(MessageEngramGroupController *)self _createGroupForExistingChat:a4])
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = [a4 groupID];
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Going to create engram group for chat: %@", buf, 0xCu);
      }
    }
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_6801C;
    v21[3] = &unk_DF2A8;
    v21[9] = a9;
    v21[10] = a11;
    v21[4] = a10;
    v21[5] = a4;
    v21[6] = a3;
    v21[7] = a6;
    v21[8] = a7;
    [(MessageEngramGroupController *)self _createEngramGroupForChat:a4 fromID:a6 service:a5 completion:v21];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "We didn't create an engram group nor did we look one up so sending with legacy methods", buf, 2u);
      }
    }
    LOBYTE(v20) = 1;
    (*((void (**)(id, id, id, id, id, id, id, void, void))a11 + 2))(a11, a10, a4, a3, a6, a7, a9, 0, v20);
  }
}

- (void)convergeOnIncomingGroup:(id)a3 chat:(id)a4 service:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_68204;
  v5[3] = &unk_DF2F8;
  v5[4] = a4;
  v5[5] = a3;
  v5[6] = self;
  [(MessageEngramGroupController *)self lookUpENGroupForChat:a4 service:a5 completion:v5];
}

- (int64_t)_daysToWaitBeforeCreatingEngroup
{
  if (objc_msgSend(-[MessageEngramGroupController lockDownManager](self, "lockDownManager"), "isInternalInstall")&& (id v3 = (id)IMGetCachedDomainValueForKey()) != 0|| (v4 = -[MessageEngramGroupController IDSServerBagiMessageSharedInstance](self, "IDSServerBagiMessageSharedInstance"), (id v3 = objc_msgSend(v4, "objectForKey:", off_EAF10)) != 0))
  {
    id v5 = [v3 integerValue];
  }
  else
  {
    id v5 = &dword_4 + 3;
  }
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = +[NSNumber numberWithInteger:v5];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Days to wait before creating engroup: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  return (int64_t)v5;
}

- (BOOL)_createGroupForExistingChat:(id)a3
{
  id v5 = [a3 engroupCreationDate];
  if ((uint64_t)v5 < 1)
  {
    int64_t v8 = [(MessageEngramGroupController *)self _daysToWaitBeforeCreatingEngroup];
    if (!v8) {
      goto LABEL_12;
    }
    id v9 = [+[NSDate date] dateByAddingTimeInterval:(double)(86400 * v8)];
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        v16 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Date to create engroup: %@", (uint8_t *)&v15, 0xCu);
      }
    }
    [(NSDate *)v9 timeIntervalSince1970];
    [a3 updateEngroupCreationDate:(uint64_t)v11];
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_13;
  }
  if ([+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(uint64_t)v5) compare:+[NSDate date]] != NSOrderedAscending)goto LABEL_11; {
  if (!IMOSLoggingEnabled())
  }
  {
LABEL_12:
    BOOL v7 = 1;
    goto LABEL_13;
  }
  v6 = OSLogHandleForIMFoundationCategory();
  BOOL v7 = 1;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Date creation is earlier than today, so we can go ahead and create the group", (uint8_t *)&v15, 2u);
  }
LABEL_13:
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", (double)(uint64_t)[a3 engroupCreationDate]);
      int v15 = 138412290;
      v16 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "We are waiting for to create this group: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  return v7;
}

- (void)_enparticipantsForDestinations:(id)a3 completion:(id)a4
{
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = a3;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Going to create enparticipants for destinations: %@", buf, 0xCu);
    }
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_68A04;
  v7[3] = &unk_DF320;
  v7[4] = a4;
  +[IMIDSIDQueryController participantsForDestinations:a3 service:IDSServiceNameiMessage listenerID:@"__kMessageGroupControllerIDSIDQueryControllerListenerID" queue:&_dispatch_main_q completionBlock:v7];
}

- (id)_URIsForChatParticipants:(id)a3 fromID:(id)a4
{
  id v5 = a4;
  return objc_msgSend(URIsFromHandles(objc_msgSend(a3, "participants")), "arrayByAddingObjectsFromArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
}

- (id)_createApplicationDataForDestinations:(id)a3
{
  if ([a3 count])
  {
    id v9 = off_EAF08;
    id v10 = a3;
    +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v4 = (void *)JWEncodeDictionary();
  }
  else
  {
    id v4 = 0;
  }
  if (![v4 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = a3;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "/**----We failed to create the shared application data!! Please file a radar!!! destinations: %@----*/", (uint8_t *)&v7, 0xCu);
      }
    }
    +[NSDictionary dictionary];
    id v4 = (void *)JWEncodeDictionary();
  }
  return [v4 _FTCopyGzippedData];
}

- (void)_createEngramGroupForChat:(id)a3 fromID:(id)a4 service:(id)a5 completion:(id)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_68C6C;
  v6[3] = &unk_DF370;
  v6[8] = a6;
  v6[4] = a5;
  v6[5] = self;
  v6[6] = a3;
  [(MessageEngramGroupController *)self _enparticipantsForDestinations:[(MessageEngramGroupController *)self _URIsForChatParticipants:a3 fromID:a4] completion:v6];
}

- (void)_createGroupFromGroupContext:(id)a3 chat:(id)a4 enparticipants:(id)a5 destinations:(id)a6 completion:(id)a7
{
  id v11 = [(MessageEngramGroupController *)self _createApplicationDataForDestinations:a6];
  if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a3;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Creating group with context: %@", buf, 0xCu);
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_6908C;
  v13[3] = &unk_DF3C0;
  v13[5] = a5;
  v13[6] = a7;
  v13[4] = a4;
  [a3 createGroupWithParticipants:a5 sharedApplicationData:v11 completion:v13];
}

- (void)_addRemoveParticipantsToENGroupForChat:(id)a3 participantsToAdd:(id)a4 participantsToRemove:(id)a5 service:(id)a6 fromID:(id)a7 attemptCount:(unint64_t)a8 completion:(id)a9
{
  if (a8 == 5)
  {
    id v9 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", EngramControllerErrorDomain, 6, 0, a6, a7);
    id v10 = (void (*)(id, void, void, NSError *))*((void *)a9 + 2);
    v10(a9, 0, 0, v9);
  }
  else
  {
    [a3 setPendingENGroupParticipantUpdate:1];
    if ([a4 count]) {
      id v17 = [a4 _URIsFromIDs];
    }
    else {
      id v17 = 0;
    }
    if ([a5 count]) {
      id v18 = [a5 _URIsFromIDs];
    }
    else {
      id v18 = 0;
    }
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_694F4;
    v19[3] = &unk_DF3E8;
    v19[5] = a4;
    v19[6] = a9;
    v19[4] = self;
    [(MessageEngramGroupController *)self _createParticipantsAndUpdateGroup:a3 addParticipantsURIs:v17 removeParticipantURIs:v18 fromID:a7 service:a6 completion:v19];
  }
}

- (void)_createParticipantsAndUpdateGroup:(id)a3 addParticipantsURIs:(id)a4 removeParticipantURIs:(id)a5 fromID:(id)a6 service:(id)a7 completion:(id)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6982C;
  v8[3] = &unk_DF438;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a6;
  v8[7] = a4;
  v8[9] = a7;
  v8[10] = a8;
  v8[8] = a5;
  [(MessageEngramGroupController *)self lookUpENGroupForChat:a3 service:a7 completion:v8];
}

- (void)_updateGroupWithParticipants:(id)a3 chat:(id)a4 service:(id)a5 participants:(id)a6 destinations:(id)a7 completion:(id)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_69CA8;
  v8[3] = &unk_DF4D8;
  v8[4] = self;
  v8[5] = a7;
  v8[6] = a3;
  v8[7] = a6;
  v8[8] = a4;
  v8[9] = a8;
  [a5 performGroupTask:v8];
}

- (id)applicationDataDictionary:(id)a3
{
  [a3 _FTOptionallyDecompressData];

  return (id)JWDecodeDictionary();
}

- (id)_URIsFromApplicationData:(id)a3
{
  id v3 = [(MessageEngramGroupController *)self applicationDataDictionary:a3];
  id v4 = [v3 objectForKey:off_EAF08];
  if (![v4 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v7 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "/**---Did not retrieve destinations from application data!! Please file a radar!! ---**//", v7, 2u);
      }
    }
    return +[NSArray array];
  }
  return v4;
}

- (void)_updateLocalParticipantsFromEngroup:(id)a3 chat:(id)a4 fromID:(id)a5
{
  id v7 = -[MessageEngramGroupController _URIsFromApplicationData:](self, "_URIsFromApplicationData:", [a3 sharedApplicationData]);
  if ([v7 count])
  {
    id v42 = a5;
    id v8 = objc_msgSend(objc_msgSend(v7, "arrayByExcludingObjectsInArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1)), "__imSetFromArray");
    id v9 = objc_msgSend(URIsFromHandles(objc_msgSend(a4, "participants")), "__imSetFromArray");
    id v10 = [v8 mutableCopy];
    [v10 minusSet:v9];
    id v11 = objc_msgSend(objc_msgSend(v10, "allObjects"), "_IDsFromURIs");

    id v12 = [v9 mutableCopy];
    [v12 minusSet:v8];
    id v29 = objc_msgSend(objc_msgSend(v12, "allObjects"), "_IDsFromURIs");

    id v13 = [a4 serviceSession];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v28 = [v11 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v28)
    {
      uint64_t v14 = *(void *)v35;
      id v15 = v28;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            id v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              int v39 = 138412290;
              uint64_t v40 = v17;
              _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "  Adding participant from update: %@", (uint8_t *)&v39, 0xCu);
            }
          }
          id v19 = [a4 chatIdentifier];
          LOBYTE(v27) = [a4 style];
          objc_msgSend(v13, "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:", 2, v17, 0, 0, 0, v19, v27, objc_msgSend(v13, "account"), a5);
        }
        id v15 = [v11 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v15);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v20 = [v29 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v31;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v29);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
          if (IMOSLoggingEnabled())
          {
            id v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              int v39 = 138412290;
              uint64_t v40 = v23;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "  Removing participant from update: %@", (uint8_t *)&v39, 0xCu);
            }
          }
          id v25 = [a4 chatIdentifier];
          LOBYTE(v27) = [a4 style];
          objc_msgSend(v13, "didChangeMemberStatus:forHandle:fromHandle:unformattedNumber:countryCode:forChat:style:account:destinationCallerID:", 3, v23, 0, 0, 0, v25, v27, objc_msgSend(v13, "account"), a5);
        }
        id v20 = [v29 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v20);
    }
    else if (!v28)
    {
      return;
    }
    [+[IMDChatStore sharedInstance] storeChat:a4];
  }
  else if (IMOSLoggingEnabled())
  {
    v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "/**---Did not retrieve destinations from application data!! Please file a radar!! ---**//", (uint8_t *)&v39, 2u);
    }
  }
}

- (id)_callerURIForChat:(id)a3
{
  [a3 serviceSession];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = 0;
    return _LastAddressedURIForChatLogMetricIfNeeded(a3, 0, [a3 serviceSession], &v7, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "/*****----We passed in a service session that is not an IMDAppleServiceSession subclass ----- PLEASE FILE A RADAR!! -------*****/", v6, 2u);
      }
    }
    return 0;
  }
}

- (void)groupContext:(id)a3 didUpdateGroup:(id)a4 withNewGroup:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6A928;
  block[3] = &unk_DF500;
  block[4] = a4;
  block[5] = self;
  block[6] = a5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

@end