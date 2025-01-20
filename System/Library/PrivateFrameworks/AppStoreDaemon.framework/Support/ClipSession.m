@interface ClipSession
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6;
- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4;
- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation ClipSession

- (void)dealloc
{
  [(NSProgress *)self->_overallProgress removeObserver:self forKeyPath:@"fractionCompleted"];
  v3.receiver = self;
  v3.super_class = (Class)ClipSession;
  [(ClipSession *)&v3 dealloc];
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v6 = a4;
  v7 = ASDLogHandleForCategory();
  v8 = v7;
  os_signpost_id_t signpostID = self->_logContext.signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, signpostID, "Clip::Event/Coordinator/Cancel", "", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FDD10;
  v13[3] = &unk_1005218C0;
  v13[4] = self;
  id v14 = v6;
  id v11 = v6;
  v12 = v11;
  if (dispatchQueue)
  {
    dispatch_sync((dispatch_queue_t)dispatchQueue->_queue, v13);
    v12 = v14;
  }
}

- (void)coordinator:(id)a3 didUpdateProgress:(double)a4 forPhase:(unint64_t)a5 overallProgress:(double)a6
{
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3 forApplicationRecord:(id)a4
{
  v5 = ASDLogHandleForCategory();
  id v6 = v5;
  os_signpost_id_t signpostID = self->_logContext.signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, signpostID, "Clip::Event/Coordinator/Complete", "", buf, 2u);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FDE34;
  block[3] = &unk_100521388;
  block[4] = self;
  if (dispatchQueue) {
    dispatch_sync((dispatch_queue_t)dispatchQueue->_queue, block);
  }
}

- (void)coordinatorDidInstallPlaceholder:(id)a3 forApplicationRecord:(id)a4
{
  v5 = ASDLogHandleForCategory();
  id v6 = v5;
  os_signpost_id_t signpostID = self->_logContext.signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, signpostID, "Clip::Event/Coordinator/Placeholder", "", buf, 2u);
  }

  v8 = ASDLogHandleForCategory();
  v9 = v8;
  os_signpost_id_t v10 = self->_logContext.signpostID;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "Clip::Coordinator/Placeholder", "", buf, 2u);
  }

  channel = self->_channel;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001FE0EC;
  v13[3] = &unk_100521910;
  v13[4] = self;
  v12 = [(ASDClipSessionChannel *)channel synchronousRemoteObjectProxyWithErrorHandler:v13];
  [v12 channelNotifyDidInstallPlaceholder];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a4;
  id v9 = a3;
  os_signpost_id_t v10 = ASDLogHandleForCategory();
  id v11 = v10;
  os_signpost_id_t signpostID = self->_logContext.signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, signpostID, "Clip::Event/Download/Progress", "", v15, 2u);
  }

  unsigned int v13 = [v9 isEqualToString:@"fractionCompleted"];
  if (v13)
  {
    [v8 fractionCompleted];
    sub_1001FE2A0((uint64_t)self, v14);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_referrerType, 0);
  objc_storeStrong((id *)&self->_installSource, 0);
  objc_storeStrong((id *)&self->_placeholderArtwork, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_dataPromise, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_urlTask, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_installProgress, 0);
  objc_storeStrong((id *)&self->_overallProgress, 0);
  objc_storeStrong((id *)&self->_streamingZipStreamConsumer, 0);
  objc_storeStrong((id *)&self->_lzmaStreamReader, 0);
  objc_storeStrong((id *)&self->_fairPlayStreamReader, 0);
  objc_storeStrong((id *)&self->_bufferedStreamReader, 0);
  objc_storeStrong((id *)&self->_downloadVariant, 0);
  objc_storeStrong((id *)&self->_downloadData, 0);
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong(&self->_replyHandler, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end