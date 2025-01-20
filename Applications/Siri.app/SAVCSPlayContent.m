@interface SAVCSPlayContent
- (id)_sr_playerForHighResolutionPlayback:(BOOL)a3;
@end

@implementation SAVCSPlayContent

- (id)_sr_playerForHighResolutionPlayback:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SAVCSPlayContent *)self playTrailer])
  {
    if (v3) {
      [(SAVCSPlayContent *)self hiresTrailerUri];
    }
    else {
    v6 = [(SAVCSPlayContent *)self lowresTrailerUri];
    }
    if (v6) {
      id v5 = [objc_alloc((Class)AVPlayer) initWithURL:v6];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end