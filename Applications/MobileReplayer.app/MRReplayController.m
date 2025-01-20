@interface MRReplayController
+ (id)sharedController;
+ (void)initialize;
- (DYCounterSupport)shaderProfiler;
- (MRReplayControllerDelegate)delegate;
- (MRReplayControllerDelegate)strongDelegate;
- (id)_archiveDirectory;
- (id)_replayerControllerSupportForCaptureStore:(id)a3;
- (id)experiments;
- (id)playbackEngine;
- (id)queue;
- (id)replayControllerSupport;
- (void)_displayPlaybackEngine;
- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5;
- (void)_processMessage:(id)a3;
- (void)_updateBackgroundImage:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setExperiments:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReplayControllerSupport:(id)a3;
- (void)setShaderProfiler:(id)a3;
@end

@implementation MRReplayController

- (MRReplayControllerDelegate)strongDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRReplayControllerDelegate *)WeakRetained;
}

+ (id)sharedController
{
  if (qword_10000D428 != -1) {
    dispatch_once(&qword_10000D428, &stru_1000082E8);
  }
  v2 = (void *)qword_10000D420;

  return v2;
}

- (void)dealloc
{
  shaderProfiler = self->_shaderProfiler;
  self->_shaderProfiler = 0;

  v4.receiver = self;
  v4.super_class = (Class)MRReplayController;
  [(MRReplayController *)&v4 dealloc];
}

- (void)_displayPlaybackEngine
{
  if (!pthread_main_np()) {
    __assert_rtn("-[MRReplayController _displayPlaybackEngine]", (const char *)&unk_1000055D9, 0, "pthread_main_np()");
  }
  id v7 = [(MRReplayController *)self strongDelegate];
  if ([v7 shouldCreateViewController])
  {
    backgroundImageViewController = self->_backgroundImageViewController;

    if (backgroundImageViewController) {
      return;
    }
    id v7 = [(MRReplayController *)self replayControllerSupport];
    objc_super v4 = [(MRReplayController *)self strongDelegate];
    v5 = [(MRReplayController *)self playbackEngine];
    v6 = [v7 viewControllerForPlaybackEngine:v5];
    [v4 setViewController:v6];
  }
}

- (id)_archiveDirectory
{
  return (id)_DYMobileArchivesDirectory(self, a2);
}

- (id)_replayerControllerSupportForCaptureStore:(id)a3
{
  id v4 = a3;
  v5 = +[DYExtensionRegistry sharedExtensionRegistry];
  v6 = [v5 extensionsForSlot:@"com.apple.mobileReplayer.replayControllerSupport"];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 objectForKey:@"class" v18];
        if (v12)
        {
          v13 = [v11 bundle];
          v14 = (objc_class *)[v13 classNamed:v12];

          if (v14)
          {
            id v15 = [[v14 alloc] initWithCaptureStore:v4];
            if (v15)
            {
              if (objc_opt_respondsToSelector())
              {
                v16 = [(MRReplayController *)self strongDelegate];
                [v15 setShouldCreateViewController:[v16 shouldCreateViewController]];
              }
              goto LABEL_15;
            }
          }
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_15:

  return v15;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc((Class)DYStandardPluginDirectoryProvider);
    v3 = +[NSBundle mainBundle];
    id v5 = [v2 initWithBundle:v3 includeDeveloperDirectory:0 includeBundleDirectory:0];

    id v4 = +[DYPluginLoader loadPluginsWithProvider:v5 pathExtension:@"mrplugin"];
  }
}

- (void)_processMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 kind];
  if (v5 - 4117 < 2)
  {
    id v7 = [(MRReplayController *)self replayControllerSupport];
    id v8 = [(MRReplayController *)self playbackEngine];
    unsigned __int8 v9 = [v7 isDebugPlaybackEngine:v8];

    if (v9)
    {
      if ([v4 kind] != 4117)
      {
        v46 = v7;
        if (!self->_shaderProfiler)
        {
          long long v19 = [(MRReplayController *)self playbackEngine];
          long long v20 = [v4 objectPayload];
          long long v21 = (DYCounterSupport *)[v7 newShaderProfilerWithPlaybackEngine:v19 payload:v20];
          shaderProfiler = self->_shaderProfiler;
          self->_shaderProfiler = v21;
        }
        objc_initWeak(&from, self);
        v23 = [v4 attributes];
        BOOL v24 = v23 == 0;

        if (v24)
        {
          v41 = [(MRReplayController *)self shaderProfiler];
          v42 = [v4 objectPayload];
          [v41 updatePayload:v42];

          v43 = [(MRReplayController *)self profileBlockQueue];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10000317C;
          v48[3] = &unk_100008310;
          objc_copyWeak(&v52, &from);
          id v49 = v7;
          v50 = self;
          id v51 = v4;
          [v43 pushBlock:v48];

          objc_destroyWeak(&v52);
        }
        else
        {
          v25 = [v4 attributes];
          v26 = [v25 objectForKeyedSubscript:@"collectInBackground"];
          BOOL v27 = v26 == 0;

          if (v27)
          {
            v44 = [(MRReplayController *)self profileBlockQueue];
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100002F14;
            v53[3] = &unk_100008310;
            objc_copyWeak(&v57, &from);
            id v54 = v7;
            id v55 = v4;
            v56 = self;
            [v44 pushBlock:v53];

            objc_destroyWeak(&v57);
          }
          else
          {
            v28 = [(MRReplayController *)self shaderProfiler];
            v29 = [v4 objectPayload];
            [v28 updatePayload:v29];

            v30 = [v4 objectPayload];
            v45 = [v30 objectForKeyedSubscript:@"maxDrawsInAnyEncoder"];

            if (v45)
            {
              v31 = [(MRReplayController *)self transport];
              id v32 = [v4 kind];
              v33 = objc_opt_new();
              v34 = +[DYTransportMessage messageWithKind:v32 plistPayload:v33];
              [v31 send:v34 inReplyTo:v4 error:0];

              v35 = (char *)[v45 unsignedIntegerValue];
              if (v35)
              {
                v36 = 0;
                do
                {
                  location[0] = 0;
                  location[1] = location;
                  location[2] = (id)0x3032000000;
                  location[3] = sub_100002CFC;
                  location[4] = sub_100002D0C;
                  v37 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ++v36, v45);
                  v71[0] = v37;
                  v38 = +[NSNumber numberWithUnsignedInteger:v35];
                  v71[1] = v38;
                  id v64 = +[NSArray arrayWithObjects:v71 count:2];

                  v39 = [(MRReplayController *)self profileBlockBackgroundQueue];
                  v58[0] = _NSConcreteStackBlock;
                  v58[1] = 3221225472;
                  v58[2] = sub_100002D14;
                  v58[3] = &unk_100008360;
                  objc_copyWeak(&v62, &from);
                  id v40 = v46;
                  v60 = self;
                  v61 = location;
                  id v59 = v40;
                  [v39 pushBlock:v58];

                  objc_destroyWeak(&v62);
                  _Block_object_dispose(location, 8);
                }
                while (v35 != v36);
              }
            }
          }
        }
        objc_destroyWeak(&from);
        goto LABEL_26;
      }
      v10 = [(MRReplayController *)self playbackEngine];
      v11 = [v4 objectPayload];
      v12 = (DYCounterSupport *)[v7 newShaderProfilerWithPlaybackEngine:v10 payload:v11];
      v13 = self->_shaderProfiler;
      self->_shaderProfiler = v12;

      if (self->_shaderProfiler)
      {
        v14 = [(MRReplayController *)self profileBlockQueue];
        v46 = v7;
        [v14 clear];

        id v15 = [(MRReplayController *)self profileBlockBackgroundQueue];
        [v15 clear];

        objc_initWeak(location, self);
        v16 = [(MRReplayController *)self profileBlockQueue];
        v66[0] = _NSConcreteStackBlock;
        v66[1] = 3221225472;
        v66[2] = sub_100002BB4;
        v66[3] = &unk_100008310;
        objc_copyWeak(&v70, location);
        id v67 = v7;
        v68 = self;
        id v69 = v4;
        [v16 pushBlock:v66];

        objc_destroyWeak(&v70);
        objc_destroyWeak(location);
LABEL_26:
        id v7 = v46;
        goto LABEL_27;
      }
    }
    v17 = [(MRReplayController *)self transport];
    long long v18 = +[DYTransportMessage messageWithKind:](DYTransportMessage, "messageWithKind:", [v4 kind]);
    [v17 send:v18 inReplyTo:v4 error:0];

LABEL_27:
    goto LABEL_28;
  }
  if (v5 == 4101)
  {
    v6 = [v4 objectPayload];
    [(MRReplayController *)self _updateBackgroundImage:v6];
  }
  else
  {
    if (v5 != 4113)
    {
      v47.receiver = self;
      v47.super_class = (Class)MRReplayController;
      [(MRReplayController *)&v47 _processMessage:v4];
      goto LABEL_28;
    }
    v6 = [v4 payload];
    [(MRReplayController *)self _updateBackgroundImage:v6];
  }

LABEL_28:
}

- (void)_updateBackgroundImage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(MRReplayController *)self strongDelegate];
  unsigned __int8 v6 = [v5 shouldCreateViewController];

  if (v6)
  {
    if (v4)
    {
      id v7 = +[UIImage imageWithData:v4];
      id v8 = v7;
      if (v7)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_100003528;
        v12[3] = &unk_1000083B0;
        v12[4] = self;
        id v8 = v7;
        id v13 = v8;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
      }
      else
      {
        _DYOLog();
      }
    }
    else
    {
      id v8 = [(MRReplayController *)self replayControllerSupport];
      unsigned __int8 v9 = [(MRReplayController *)self playbackEngine];
      v10 = [v8 viewControllerForPlaybackEngine:v9];

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000034B8;
      block[3] = &unk_1000083B0;
      block[4] = self;
      id v15 = v10;
      id v11 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_playbackArchiveWithExperiment:(id)a3 passingFuture:(id)a4 resolvingFuture:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(MRReplayController *)self archiveStack];
  if ([v10 empty]) {
    __assert_rtn("-[MRReplayController _playbackArchiveWithExperiment:passingFuture:resolvingFuture:]", (const char *)&unk_1000055D9, 0, "![self.archiveStack empty]");
  }

  id v11 = [(MRReplayController *)self profileInfo];
  id v12 = [v11 count];

  if (v12)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003998;
    block[3] = &unk_1000083D8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
    id v13 = [(MRReplayController *)self replayControllerSupport];
    v14 = [(MRReplayController *)self playbackEngine];
    id v15 = objc_opt_new();
    id v16 = [v13 newShaderProfilerWithPlaybackEngine:v14 payload:v15];

    v17 = [(MRReplayController *)self profileInfo];
    long long v18 = [v17 objectForKeyedSubscript:kDYQueryAvailableCounters];

    if (v18)
    {
      long long v19 = [(MRReplayController *)self replayControllerSupport];
      uint64_t v20 = [v19 availableCountersForFrameProfiler:v16];
    }
    else
    {
      long long v21 = [(MRReplayController *)self profileInfo];
      v22 = [v21 objectForKeyedSubscript:kDYDerivedCounterData];

      if (!v22)
      {
        long long v19 = [(MRReplayController *)self replayControllerSupport];
        BOOL v24 = [(MRReplayController *)self profileInfo];
        v23 = [v19 profilerCounters:v24 withFrameProfiler:v16];

        goto LABEL_9;
      }
      long long v19 = [(MRReplayController *)self replayControllerSupport];
      uint64_t v20 = [v19 derivedCounterDataForFrameProfiler:v16];
    }
    v23 = (void *)v20;
LABEL_9:

    [v9 resolveWithFuture:v23];
    goto LABEL_10;
  }
  v26.receiver = self;
  v26.super_class = (Class)MRReplayController;
  [(MRReplayController *)&v26 _playbackArchiveWithExperiment:v8 passingFuture:v9 resolvingFuture:v5];
LABEL_10:
}

- (id)queue
{
  return self->queue;
}

- (void)setQueue:(id)a3
{
}

- (id)playbackEngine
{
  return self->playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (id)replayControllerSupport
{
  return self->replayControllerSupport;
}

- (void)setReplayControllerSupport:(id)a3
{
}

- (id)experiments
{
  return self->experiments;
}

- (void)setExperiments:(id)a3
{
}

- (MRReplayControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRReplayControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (DYCounterSupport)shaderProfiler
{
  return self->_shaderProfiler;
}

- (void)setShaderProfiler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaderProfiler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->experiments, 0);
  objc_storeStrong((id *)&self->replayControllerSupport, 0);
  objc_storeStrong((id *)&self->playbackEngine, 0);
  objc_storeStrong((id *)&self->queue, 0);

  objc_storeStrong((id *)&self->_backgroundImageViewController, 0);
}

@end