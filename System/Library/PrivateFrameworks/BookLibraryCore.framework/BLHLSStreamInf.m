@interface BLHLSStreamInf
- (NSString)audio;
- (NSString)codecs;
- (NSURL)url;
- (id)description;
- (unint64_t)averageBandwidth;
- (unint64_t)averageBandwidthFallbackToPeak;
- (unint64_t)bandwidth;
- (void)setPropertiesFromAttributeList:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation BLHLSStreamInf

- (void)setPropertiesFromAttributeList:(id)a3
{
  id v19 = a3;
  v6 = objc_msgSend_objectForKeyedSubscript_(v19, v4, @"BANDWIDTH", v5);
  self->_bandwidth = sub_21DFF42E0(v6);
  v9 = objc_msgSend_objectForKeyedSubscript_(v19, v7, @"AVERAGE-BANDWIDTH", v8);
  v12 = v9;
  if (v9) {
    self->_averageBandwidth = sub_21DFF42E0(v9);
  }
  objc_msgSend_objectForKeyedSubscript_(v19, v10, @"CODECS", v11);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  codecs = self->_codecs;
  self->_codecs = v13;

  objc_msgSend_objectForKeyedSubscript_(v19, v15, @"AUDIO", v16);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  audio = self->_audio;
  self->_audio = v17;
}

- (id)description
{
  uint64_t v5 = NSString;
  uint64_t v6 = objc_msgSend_bandwidth(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_averageBandwidth(self, v7, v8, v9);
  v14 = objc_msgSend_codecs(self, v11, v12, v13);
  v18 = objc_msgSend_audio(self, v15, v16, v17);
  v21 = objc_msgSend_stringWithFormat_(v5, v19, @"{ Bandwidth: %llu, Average Bandwidth: %llu, codecs: %@, audio: %@", v20, v6, v10, v14, v18);

  return v21;
}

- (unint64_t)averageBandwidthFallbackToPeak
{
  unint64_t result = self->_averageBandwidth;
  if (!result) {
    return self->_bandwidth;
  }
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (unint64_t)bandwidth
{
  return self->_bandwidth;
}

- (unint64_t)averageBandwidth
{
  return self->_averageBandwidth;
}

- (NSString)codecs
{
  return self->_codecs;
}

- (NSString)audio
{
  return self->_audio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_codecs, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end