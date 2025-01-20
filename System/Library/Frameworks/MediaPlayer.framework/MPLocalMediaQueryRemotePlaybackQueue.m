@interface MPLocalMediaQueryRemotePlaybackQueue
+ (BOOL)supportsSecureCoding;
- (BOOL)verifyWithError:(id *)a3;
- (MPLocalMediaQueryRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4;
- (MPMediaItem)firstItem;
- (MPMediaQuery)mediaQuery;
- (id)description;
- (int64_t)repeatType;
- (int64_t)shuffleType;
@end

@implementation MPLocalMediaQueryRemotePlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstItem, 0);

  objc_storeStrong((id *)&self->_mediaQuery, 0);
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (MPMediaItem)firstItem
{
  return self->_firstItem;
}

- (MPMediaQuery)mediaQuery
{
  return self->_mediaQuery;
}

- (BOOL)verifyWithError:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = [(MPLocalMediaQueryRemotePlaybackQueue *)self mediaQuery];
  if ([v4 _countOfItems] || objc_msgSend(v4, "_countOfCollections"))
  {

    return 1;
  }
  else
  {

    if (a3)
    {
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = @"The provided queue has no items or collections.";
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      id v7 = (id) [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"MPErrorDomain" code:100 userInfo:v6];
      *a3 = v7;
    }
    return 0;
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  mediaQuery = self->_mediaQuery;
  firstItem = self->_firstItem;
  id v7 = MPNSStringFromShuffleType(self->_shuffleType);
  uint64_t v8 = MPNSStringFromRepeatType(self->_repeatType);
  v9 = [v3 stringWithFormat:@"<%@ %p, query = %@, firstItem = %@, shuffleType = %@, repeatType = %@>", v4, self, mediaQuery, firstItem, v7, v8];

  return v9;
}

- (MPLocalMediaQueryRemotePlaybackQueue)initWithMediaRemotePlaybackQueue:(_MRSystemAppPlaybackQueue *)a3 options:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v59.receiver = self;
  v59.super_class = (Class)MPLocalMediaQueryRemotePlaybackQueue;
  uint64_t v4 = -[MPRemotePlaybackQueue initWithMediaRemotePlaybackQueue:options:](&v59, sel_initWithMediaRemotePlaybackQueue_options_);
  v5 = v4;
  if (!v4) {
    return v5;
  }
  v6 = [(MPRemotePlaybackQueue *)v4 userIdentity];
  id v7 = +[MPMediaLibrary deviceMediaLibraryWithUserIdentity:v6];

  uint64_t v8 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v7;
    _os_log_impl(&dword_1952E8000, v8, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [library] library=%{public}@", buf, 0xCu);
  }

  v9 = MRSystemAppPlaybackQueueGetLocalQueryData();
  if (MRSystemAppPlaybackQueueGetLocalQueryEncodingType() != 1)
  {
    v14 = [[MPPMediaQuery alloc] initWithData:v9];
    v15 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v14;
      _os_log_impl(&dword_1952E8000, v15, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [query] source=protobuf protobuf=%{public}@", buf, 0xCu);
    }

    if (v14)
    {
      v16 = [[MPMediaQuery alloc] initWithProtobufferDecodableObject:v14 library:v7];
      mediaQuery = v5->_mediaQuery;
      v5->_mediaQuery = v16;

      v18 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v5->_mediaQuery;
        *(_DWORD *)buf = 138543362;
        v61 = (MPPMediaQuery *)v19;
        v20 = "RPQ: initWithMediaRemotePlaybackQueue: [query] source=protobuf query=%{public}@";
        v21 = v18;
        os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
        uint32_t v23 = 12;
LABEL_15:
        _os_log_impl(&dword_1952E8000, v21, v22, v20, buf, v23);
      }
    }
    else
    {
      v18 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = "RPQ: initWithMediaRemotePlaybackQueue: [query] source=protobuf query=(null)";
        v21 = v18;
        os_log_type_t v22 = OS_LOG_TYPE_ERROR;
        uint32_t v23 = 2;
        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }
  objc_opt_class();
  uint64_t v10 = MSVUnarchivedObjectOfClass();
  v11 = v5->_mediaQuery;
  v5->_mediaQuery = (MPMediaQuery *)v10;

  v12 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v5->_mediaQuery;
    *(_DWORD *)buf = 138543362;
    v61 = (MPPMediaQuery *)v13;
    _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [query] source=bplist query=%{public}@", buf, 0xCu);
  }

LABEL_17:
  [(MPMediaQuery *)v5->_mediaQuery setMediaLibrary:v7];
  v24 = MRSystemAppPlaybackQueueGetLocalQueryFirstItemMultiverseIDData();
  if (v24)
  {
    v25 = (MPMediaQuery *)[objc_alloc(MEMORY[0x1E4F79A48]) initWithData:v24];
    v26 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = (MPPMediaQuery *)v25;
      _os_log_impl(&dword_1952E8000, v26, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=mip multiverseIdentifier=%{public}@", buf, 0xCu);
    }

    v27 = [[MPMediaItem alloc] initWithMultiverseIdentifier:v25 library:v7];
    firstItem = v5->_firstItem;
    v5->_firstItem = v27;

    v29 = v5->_firstItem;
    v30 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    v31 = v30;
    if (v29)
    {
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v32 = v5->_firstItem;
        *(_DWORD *)buf = 138543362;
        v61 = (MPPMediaQuery *)v32;
        v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=mip firstItem=%{public}@";
LABEL_29:
        v48 = v31;
        os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
        uint32_t v50 = 12;
LABEL_35:
        _os_log_impl(&dword_1952E8000, v48, v49, v33, buf, v50);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=mip firstItem=(null)";
    goto LABEL_34;
  }
  uint64_t LocalQueryFirstItemPID = MRSystemAppPlaybackQueueGetLocalQueryFirstItemPID();
  if (LocalQueryFirstItemPID)
  {
    uint64_t v35 = LocalQueryFirstItemPID;
    v36 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v61 = (MPPMediaQuery *)v35;
      _os_log_impl(&dword_1952E8000, v36, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=pid pid=%lld", buf, 0xCu);
    }

    v37 = [MPMediaQuery alloc];
    v38 = (void *)MEMORY[0x1E4F1CAD0];
    v39 = [NSNumber numberWithLongLong:v35];
    v40 = +[MPMediaPropertyPredicate predicateWithValue:v39 forProperty:@"persistentID"];
    v41 = [v38 setWithObject:v40];
    v25 = [(MPMediaQuery *)v37 initWithFilterPredicates:v41 library:v7];

    [(MPMediaQuery *)v25 setShouldIncludeNonLibraryEntities:1];
    v42 = [(MPMediaQuery *)v25 items];
    uint64_t v43 = [v42 firstObject];
    v44 = v5->_firstItem;
    v5->_firstItem = (MPMediaItem *)v43;

    v45 = v5->_firstItem;
    v46 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
    v31 = v46;
    if (v45)
    {
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = v5->_firstItem;
        *(_DWORD *)buf = 138543362;
        v61 = (MPPMediaQuery *)v47;
        v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=pid firstItem=%{public}@";
        goto LABEL_29;
      }
LABEL_36:

      goto LABEL_37;
    }
    if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_WORD *)buf = 0;
    v33 = "RPQ: initWithMediaRemotePlaybackQueue: [firstItem] source=pid firstItem=(null)";
LABEL_34:
    v48 = v31;
    os_log_type_t v49 = OS_LOG_TYPE_ERROR;
    uint32_t v50 = 2;
    goto LABEL_35;
  }
LABEL_37:
  unsigned int LocalQueryShuffleMode = MRSystemAppPlaybackQueueGetLocalQueryShuffleMode();
  if (LocalQueryShuffleMode > 3) {
    int64_t v52 = 0;
  }
  else {
    int64_t v52 = qword_19568C4B8[LocalQueryShuffleMode];
  }
  v5->_shuffleType = v52;
  unsigned int LocalQueryRepeatMode = MRSystemAppPlaybackQueueGetLocalQueryRepeatMode();
  if (LocalQueryRepeatMode > 3) {
    int64_t v54 = 0;
  }
  else {
    int64_t v54 = qword_19568C498[LocalQueryRepeatMode];
  }
  v5->_repeatType = v54;
  v55 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl_Oversize");
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    MPNSStringFromShuffleType(v5->_shuffleType);
    v56 = (MPPMediaQuery *)objc_claimAutoreleasedReturnValue();
    v57 = MPNSStringFromRepeatType(v5->_repeatType);
    *(_DWORD *)buf = 138543618;
    v61 = v56;
    __int16 v62 = 2114;
    v63 = v57;
    _os_log_impl(&dword_1952E8000, v55, OS_LOG_TYPE_DEFAULT, "RPQ: initWithMediaRemotePlaybackQueue: [shuffle/repeat] shuffle=%{public}@ repeat=%{public}@", buf, 0x16u);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end