@interface AVCMediaRecorderConfiguration
+ (id)newClientDictionary:(id)a3 clientPid:(int)a4;
- (id)description;
- (id)dictionary;
- (unsigned)mediaAvailability;
- (void)setMediaAvailability:(unsigned int)a3;
@end

@implementation AVCMediaRecorderConfiguration

+ (id)newClientDictionary:(id)a3 clientPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v6 = objc_alloc_init(VCMediaRecorderConfiguration);
  -[VCMediaRecorderConfiguration setMediaAvailability:](v6, "setMediaAvailability:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMomentsMediaAvailability"), "unsignedIntValue"));
  [(VCMediaRecorderConfiguration *)v6 setClientPid:v4];
  return v6;
}

- (id)dictionary
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"vcMomentsMediaAvailability";
  v4[0] = [NSNumber numberWithUnsignedInt:self->_mediaAvailability];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"mediaAvailability=%u", self->_mediaAvailability);
}

- (unsigned)mediaAvailability
{
  return self->_mediaAvailability;
}

- (void)setMediaAvailability:(unsigned int)a3
{
  self->_mediaAvailability = a3;
}

@end