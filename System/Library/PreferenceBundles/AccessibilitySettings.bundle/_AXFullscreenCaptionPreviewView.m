@interface _AXFullscreenCaptionPreviewView
- (AXCaptionSubtitlePreviewView)captionSubtitlePreviewView;
- (BOOL)isAccessibilityElement;
- (UIImageView)cloudsView1;
- (UIImageView)cloudsView2;
- (_AXFullscreenCaptionPreviewView)init;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (void)setCaptionSubtitlePreviewView:(id)a3;
- (void)setCloudsView1:(id)a3;
- (void)setCloudsView2:(id)a3;
@end

@implementation _AXFullscreenCaptionPreviewView

- (_AXFullscreenCaptionPreviewView)init
{
  v11.receiver = self;
  v11.super_class = (Class)_AXFullscreenCaptionPreviewView;
  v2 = [(_AXFullscreenCaptionPreviewView *)&v11 init];
  if (v2)
  {
    v3 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    cloudsView1 = v2->_cloudsView1;
    v2->_cloudsView1 = v3;

    [(_AXFullscreenCaptionPreviewView *)v2 addSubview:v2->_cloudsView1];
    [(UIImageView *)v2->_cloudsView1 setAutoresizingMask:18];
    [(UIImageView *)v2->_cloudsView1 setContentMode:2];
    [(UIImageView *)v2->_cloudsView1 setAlpha:1.0];
    [(UIImageView *)v2->_cloudsView1 setIsAccessibilityElement:0];
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    cloudsView2 = v2->_cloudsView2;
    v2->_cloudsView2 = v5;

    [(_AXFullscreenCaptionPreviewView *)v2 addSubview:v2->_cloudsView2];
    [(UIImageView *)v2->_cloudsView2 setAutoresizingMask:18];
    [(UIImageView *)v2->_cloudsView2 setContentMode:2];
    [(UIImageView *)v2->_cloudsView2 setAlpha:0.0];
    [(UIImageView *)v2->_cloudsView2 setIsAccessibilityElement:0];
    v7 = objc_alloc_init(AXCaptionSubtitlePreviewView);
    captionSubtitlePreviewView = v2->_captionSubtitlePreviewView;
    v2->_captionSubtitlePreviewView = v7;

    [(_AXFullscreenCaptionPreviewView *)v2 addSubview:v2->_captionSubtitlePreviewView];
    v9 = settingsLocString(@"SAMPLE_CAPTION_TEXT", @"Captioning");
    [(AXCaptionSubtitlePreviewView *)v2->_captionSubtitlePreviewView setText:v9];

    [(AXCaptionSubtitlePreviewView *)v2->_captionSubtitlePreviewView setAutoresizingMask:18];
    [(AXCaptionSubtitlePreviewView *)v2->_captionSubtitlePreviewView setIsAccessibilityElement:0];
  }
  return v2;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"subtitle.preview.label.spoken", @"Captioning");
}

- (id)accessibilityHint
{
  return settingsLocString(@"dismiss.caption.fullscreen.preview", @"Captioning");
}

- (AXCaptionSubtitlePreviewView)captionSubtitlePreviewView
{
  return self->_captionSubtitlePreviewView;
}

- (void)setCaptionSubtitlePreviewView:(id)a3
{
}

- (UIImageView)cloudsView1
{
  return self->_cloudsView1;
}

- (void)setCloudsView1:(id)a3
{
}

- (UIImageView)cloudsView2
{
  return self->_cloudsView2;
}

- (void)setCloudsView2:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudsView2, 0);
  objc_storeStrong((id *)&self->_cloudsView1, 0);

  objc_storeStrong((id *)&self->_captionSubtitlePreviewView, 0);
}

@end