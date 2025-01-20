@interface MPStoreLyricsResponse
- (NSString)lyricsContent;
- (NSString)lyricsID;
- (void)setLyricsContent:(id)a3;
- (void)setLyricsID:(id)a3;
@end

@implementation MPStoreLyricsResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsID, 0);

  objc_storeStrong((id *)&self->_lyricsContent, 0);
}

- (void)setLyricsID:(id)a3
{
}

- (NSString)lyricsID
{
  return self->_lyricsID;
}

- (void)setLyricsContent:(id)a3
{
}

- (NSString)lyricsContent
{
  return self->_lyricsContent;
}

@end