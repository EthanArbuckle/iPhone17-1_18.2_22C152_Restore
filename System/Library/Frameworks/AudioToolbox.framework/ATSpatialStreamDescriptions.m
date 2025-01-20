@interface ATSpatialStreamDescriptions
- (ATSpatialStreamDescriptions)init;
- (ATSpatialStreamDescriptions)initWithFlatIOFormat:(id)a3 type:(int64_t)a4;
- (AVAudioFormat)flatFormat;
- (AVAudioFormat)streamFormat;
- (NSArray)streamParameters;
- (id)description;
- (int64_t)type;
@end

@implementation ATSpatialStreamDescriptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamParameters, 0);
  objc_storeStrong((id *)&self->_streamFormat, 0);

  objc_storeStrong((id *)&self->_flatFormat, 0);
}

- (AVAudioFormat)streamFormat
{
  return self->_streamFormat;
}

- (AVAudioFormat)flatFormat
{
  return self->_flatFormat;
}

- (int64_t)type
{
  return self->_type;
}

- (NSArray)streamParameters
{
  v2 = (void *)[(NSMutableArray *)self->_streamParameters copy];

  return (NSArray *)v2;
}

- (ATSpatialStreamDescriptions)initWithFlatIOFormat:(id)a3 type:(int64_t)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v51.receiver = self;
  v51.super_class = (Class)ATSpatialStreamDescriptions;
  v8 = [(ATSpatialStreamDescriptions *)&v51 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_44;
  }
  v8->_int64_t type = a4;
  p_flatFormat = (id *)&v8->_flatFormat;
  objc_storeStrong((id *)&v8->_flatFormat, a3);
  uint64_t v11 = objc_opt_new();
  streamParameters = v9->_streamParameters;
  v9->_streamParameters = (NSMutableArray *)v11;

  int64_t type = v9->_type;
  if (!type)
  {
    objc_storeStrong((id *)&v9->_streamFormat, v9->_flatFormat);
    int v15 = 1;
    goto LABEL_30;
  }
  if (type != 1)
  {
    v14 = sATSpatialStreamLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int64_t v16 = v9->_type;
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "ATSpatialParameters.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 234;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v16;
      _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: invalid stream type %d!", buf, 0x18u);
    }
    goto LABEL_8;
  }
  if ([*p_flatFormat channelCount] >= 2
    && [*p_flatFormat isInterleaved])
  {
    v14 = sATSpatialStreamLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "ATSpatialParameters.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 207;
      _os_log_impl(&dword_1A3931000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: Expect a deinterleaved format for multi-stream type!", buf, 0x12u);
    }
LABEL_8:

LABEL_42:
    p_super = &v9->super;
    v9 = 0;
    goto LABEL_43;
  }
  unsigned int v17 = [*p_flatFormat channelCount];
  unsigned int v18 = v17;
  if (v17 <= 1) {
    int v15 = 1;
  }
  else {
    int v15 = v17;
  }
  if (v15 <= 0)
  {
LABEL_49:
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  uint64_t v19 = [*p_flatFormat streamDescription];
  long long v20 = *(_OWORD *)v19;
  long long v21 = *(_OWORD *)(v19 + 16);
  uint64_t v50 = *(void *)(v19 + 32);
  long long v48 = v20;
  long long v49 = v21;
  if (v18 >= 2)
  {
    if ((BYTE12(v48) & 0x20) != 0)
    {
      unsigned int v22 = 1;
    }
    else
    {
      unsigned int v22 = HIDWORD(v49);
      if (!HIDWORD(v49))
      {
        unsigned int v23 = (v50 + 7) >> 3;
LABEL_24:
        *((void *)&v49 + 1) = v23 | 0x100000000;
        *(void *)&long long v49 = *((void *)&v49 + 1);
        uint64_t v52 = 0;
        v53 = &v52;
        uint64_t v54 = 0x2050000000;
        v26 = (void *)getAVAudioChannelLayoutClass::softClass;
        uint64_t v55 = getAVAudioChannelLayoutClass::softClass;
        if (!getAVAudioChannelLayoutClass::softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getAVAudioChannelLayoutClass_block_invoke;
          *(void *)&buf[24] = &unk_1E5B16400;
          *(void *)&buf[32] = &v52;
          __getAVAudioChannelLayoutClass_block_invoke((uint64_t)buf);
          v26 = (void *)v53[3];
        }
        id v27 = v26;
        _Block_object_dispose(&v52, 8);
        v25 = (AVAudioFormat *)objc_msgSend(objc_alloc((Class)v27), "initWithLayoutTag:", 6553601, v48, v49);
        uint64_t v52 = 0;
        v53 = &v52;
        uint64_t v54 = 0x2050000000;
        v28 = (void *)getAVAudioFormatClass::softClass;
        uint64_t v55 = getAVAudioFormatClass::softClass;
        if (!getAVAudioFormatClass::softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __getAVAudioFormatClass_block_invoke;
          *(void *)&buf[24] = &unk_1E5B16400;
          *(void *)&buf[32] = &v52;
          __getAVAudioFormatClass_block_invoke((uint64_t)buf);
          v28 = (void *)v53[3];
        }
        id v29 = v28;
        _Block_object_dispose(&v52, 8);
        uint64_t v30 = [objc_alloc((Class)v29) initWithStreamDescription:&v48 channelLayout:v25];
        streamFormat = v9->_streamFormat;
        v9->_streamFormat = (AVAudioFormat *)v30;

        goto LABEL_29;
      }
    }
    unsigned int v23 = DWORD2(v49) / v22;
    goto LABEL_24;
  }
  v24 = v9->_flatFormat;
  v25 = v9->_streamFormat;
  v9->_streamFormat = v24;
LABEL_29:

LABEL_30:
  if (!v9->_streamFormat)
  {
LABEL_47:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_48;
  }
  int v32 = v15;
  do
  {
    id v33 = [[ATSpatialStreamParameters alloc] initInternalWithFormat:v9->_streamFormat];
    v34 = v33;
    if (!v33)
    {
      v43 = sATSpatialStreamLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        int v44 = v9->_type;
        id v45 = [(AVAudioFormat *)v9->_streamFormat description];
        uint64_t v46 = [v45 UTF8String];
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = "ATSpatialParameters.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 254;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v44;
        *(_WORD *)&buf[24] = 2080;
        *(void *)&buf[26] = v46;
        _os_log_impl(&dword_1A3931000, v43, OS_LOG_TYPE_ERROR, "%25s:%-5d Error: could not create stream params for type %d, format %s!", buf, 0x22u);
      }
      goto LABEL_42;
    }
    if ([v33 isEnabled])
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
LABEL_46:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_47;
    }
    v35 = [v34 format];
    char v36 = [v35 isEqual:v9->_streamFormat];

    if ((v36 & 1) == 0) {
      goto LABEL_46;
    }
    [(NSMutableArray *)v9->_streamParameters addObject:v34];

    --v32;
  }
  while (v32);
  if ([(NSMutableArray *)v9->_streamParameters count] != v15)
  {
LABEL_48:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_49;
  }
  p_super = sATSpatialStreamLog();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
  {
    int v38 = v9->_type;
    id v39 = [(AVAudioFormat *)v9->_flatFormat description];
    uint64_t v40 = [v39 UTF8String];
    id v41 = [(AVAudioFormat *)v9->_streamFormat description];
    uint64_t v42 = [v41 UTF8String];
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = "ATSpatialParameters.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 269;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v9;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v38;
    *(_WORD *)&buf[34] = 2080;
    *(void *)&buf[36] = v40;
    __int16 v57 = 2080;
    uint64_t v58 = v42;
    __int16 v59 = 1024;
    int v60 = v15;
    _os_log_impl(&dword_1A3931000, p_super, OS_LOG_TYPE_DEBUG, "%25s:%-5d streamdescs@%p: type %d, flat format %s, stream format %s, #streams %d", buf, 0x3Cu);
  }
LABEL_43:

LABEL_44:
  return v9;
}

- (ATSpatialStreamDescriptions)init
{
  return 0;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<ATSpatialStreamDescriptions@%p: format=%@, streams=[", self, self->_flatFormat];
  for (unint64_t i = 0; [(NSMutableArray *)self->_streamParameters count] > i; ++i)
  {
    v5 = [(NSMutableArray *)self->_streamParameters objectAtIndex:i];
    if ([v5 isEnabled])
    {
      v6 = [v5 identifier];
      [v3 appendFormat:@"%@", v6];
    }
    else
    {
      [v3 appendFormat:@"d"];
    }
    if ([(NSMutableArray *)self->_streamParameters count] - 1 > i) {
      [v3 appendFormat:@", "];
    }
  }
  [v3 appendString:@"]>"];

  return v3;
}

@end