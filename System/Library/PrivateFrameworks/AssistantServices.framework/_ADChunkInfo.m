@interface _ADChunkInfo
- (BOOL)isValid;
- (NSString)postGen;
- (NSString)validity;
- (_ADChunkInfo)initWithDictionary:(id)a3;
- (id)anchorWithKey:(id)a3 appID:(id)a4 syncType:(id)a5;
- (id)dictionaryRepresentation;
- (void)setPostGen:(id)a3;
- (void)setValidity:(id)a3;
@end

@implementation _ADChunkInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validity, 0);
  objc_storeStrong((id *)&self->_postGen, 0);
}

- (void)setValidity:(id)a3
{
}

- (NSString)validity
{
  return self->_validity;
}

- (void)setPostGen:(id)a3
{
}

- (NSString)postGen
{
  return self->_postGen;
}

- (id)anchorWithKey:(id)a3 appID:(id)a4 syncType:(id)a5
{
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)SASyncAnchor);
  [v11 setKey:v10];

  [v11 setValidity:self->_validity];
  [v11 setGeneration:self->_postGen];
  if (v8 | v9)
  {
    id v12 = objc_alloc_init((Class)SASyncAppMetaData);
    if (v9)
    {
      unint64_t v16 = v9;
      v13 = +[NSArray arrayWithObjects:&v16 count:1];
      [v12 setSyncSlots:v13];
    }
    if (v8)
    {
      id v14 = objc_alloc_init((Class)SASyncAppIdentifyingInfo);
      [v14 setBundleId:v8];
      [v12 setAppIdentifyingInfo:v14];
    }
    [v11 setAppMetaData:v12];
  }
  return v11;
}

- (BOOL)isValid
{
  return [(NSString *)self->_postGen length] || [(NSString *)self->_validity length] != 0;
}

- (id)dictionaryRepresentation
{
  id v3 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
  v4 = v3;
  postGen = self->_postGen;
  if (postGen) {
    [v3 setObject:postGen forKey:SASyncAnchorGenerationPListKey];
  }
  validity = self->_validity;
  if (validity) {
    [v4 setObject:validity forKey:SASyncAnchorValidityPListKey];
  }
  return v4;
}

- (_ADChunkInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_ADChunkInfo;
  v5 = [(_ADChunkInfo *)&v13 init];
  if (v5)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      uint64_t v6 = SASyncAnchorGenerationPListKey;
      v7 = [v4 objectForKey:SASyncAnchorGenerationPListKey];
      if (objc_opt_isKindOfClass())
      {
        [(_ADChunkInfo *)v5 setPostGen:v7];
      }
      else if (v7)
      {
        unint64_t v9 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[_ADChunkInfo initWithDictionary:]";
          __int16 v16 = 2112;
          uint64_t v17 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Non-string object under key %@", buf, 0x16u);
        }
      }
      id v10 = [v4 objectForKey:SASyncAnchorValidityPListKey];

      if (objc_opt_isKindOfClass())
      {
        [(_ADChunkInfo *)v5 setValidity:v10];
      }
      else if (v10)
      {
        id v11 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[_ADChunkInfo initWithDictionary:]";
          __int16 v16 = 2112;
          uint64_t v17 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Non-string object under key %@", buf, 0x16u);
        }
      }
    }
    else
    {
      unint64_t v8 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[_ADChunkInfo initWithDictionary:]";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Invalid parameter is not a dictionary!", buf, 0xCu);
      }
    }
  }

  return v5;
}

@end