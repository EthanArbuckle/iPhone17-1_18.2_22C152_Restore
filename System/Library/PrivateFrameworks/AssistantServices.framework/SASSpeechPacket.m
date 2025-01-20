@interface SASSpeechPacket
- (id)description;
@end

@implementation SASSpeechPacket

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(SASSpeechPacket *)self packets];
  id v5 = [v4 count];
  id v6 = [(SASSpeechPacket *)self packetNumber];
  v7 = [(SASSpeechPacket *)self aceId];
  v8 = [(SASSpeechPacket *)self refId];
  v9 = +[NSString stringWithFormat:@"[%@ count:%tu total:%ld\n  aceId: %@\n  refId: %@]", v3, v5, v6, v7, v8];

  return v9;
}

@end