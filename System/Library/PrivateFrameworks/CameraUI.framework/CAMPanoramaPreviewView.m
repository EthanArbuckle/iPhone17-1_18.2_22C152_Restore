@interface CAMPanoramaPreviewView
- (_CAImageQueue)imageQueue;
- (void)setImageQueue:(_CAImageQueue *)a3;
@end

@implementation CAMPanoramaPreviewView

- (void)setImageQueue:(_CAImageQueue *)a3
{
  id v4 = [(CAMPanoramaPreviewView *)self layer];
  [v4 setContents:a3];
}

- (_CAImageQueue)imageQueue
{
  v2 = [(CAMPanoramaPreviewView *)self layer];
  v3 = (_CAImageQueue *)[v2 contents];

  return v3;
}

@end