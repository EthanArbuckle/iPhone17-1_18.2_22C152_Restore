@interface HMIHLSPlaylist
- (HMIHLSPlaylist)initWithPlaylistString:(id)a3;
- (HMIHLSPlaylist)initWithTargetDuration:(double)a3;
- (NSMutableArray)lines;
- (NSString)playlistString;
- (void)appendEncryptionModeWithPath:(id)a3;
- (void)appendIFrameOnly;
- (void)appendInitializationSegmentWithPath:(id)a3;
- (void)appendSeparableSegmentWithPath:(id)a3 duration:(double)a4;
- (void)appendSeparableSegmentWithPath:(id)a3 duration:(double)a4 byteRange:(_NSRange)a5;
- (void)end;
- (void)open;
@end

@implementation HMIHLSPlaylist

- (HMIHLSPlaylist)initWithPlaylistString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMIHLSPlaylist;
  v5 = [(HMIHLSPlaylist *)&v10 init];
  if (v5)
  {
    v6 = [v4 componentsSeparatedByString:@"\n"];
    uint64_t v7 = [v6 mutableCopy];
    lines = v5->_lines;
    v5->_lines = (NSMutableArray *)v7;
  }
  return v5;
}

- (HMIHLSPlaylist)initWithTargetDuration:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HMIHLSPlaylist;
  id v4 = [(HMIHLSPlaylist *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263EFF980] array];
    lines = v4->_lines;
    v4->_lines = (NSMutableArray *)v5;

    [(NSMutableArray *)v4->_lines addObject:@"#EXTM3U"];
    [(NSMutableArray *)v4->_lines addObject:@"#EXT-X-VERSION:7"];
    uint64_t v7 = v4->_lines;
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"#EXT-X-TARGETDURATION:%.6f", *(void *)&a3);
    [(NSMutableArray *)v7 addObject:v8];

    [(NSMutableArray *)v4->_lines addObject:@"#EXT-X-PLAYLIST-TYPE:VOD"];
    [(NSMutableArray *)v4->_lines addObject:@"#EXT-X-INDEPENDENT-SEGMENTS"];
  }
  return v4;
}

- (NSString)playlistString
{
  v2 = [(HMIHLSPlaylist *)self lines];
  v3 = [v2 componentsJoinedByString:@"\n"];

  return (NSString *)v3;
}

- (void)appendIFrameOnly
{
}

- (void)appendEncryptionModeWithPath:(id)a3
{
  lines = self->_lines;
  [NSString stringWithFormat:@"#EXT-X-KEY:METHOD=AES-256-GCM,URI=\"%@\"", a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)lines addObject:v4];
}

- (void)appendInitializationSegmentWithPath:(id)a3
{
  lines = self->_lines;
  [NSString stringWithFormat:@"#EXT-X-MAP:URI=\"%@\"", a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)lines addObject:v4];
}

- (void)appendSeparableSegmentWithPath:(id)a3 duration:(double)a4
{
}

- (void)appendSeparableSegmentWithPath:(id)a3 duration:(double)a4 byteRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v15 = a3;
  lines = self->_lines;
  objc_super v10 = objc_msgSend(NSString, "stringWithFormat:", @"#EXTINF:%.5f", *(void *)&a4);
  [(NSMutableArray *)lines addObject:v10];

  if (length)
  {
    v11 = self->_lines;
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"#EXT-X-BYTERANGE:%lu@%lu", length, location);
    [(NSMutableArray *)v11 addObject:v12];
  }
  v13 = self->_lines;
  v14 = [NSString stringWithFormat:@"%@", v15];
  [(NSMutableArray *)v13 addObject:v14];
}

- (void)open
{
}

- (void)end
{
}

- (NSMutableArray)lines
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end