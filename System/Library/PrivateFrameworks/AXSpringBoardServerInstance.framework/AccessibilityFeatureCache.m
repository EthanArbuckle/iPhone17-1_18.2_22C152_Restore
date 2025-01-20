@interface AccessibilityFeatureCache
+ (BOOL)supportsSecureCoding;
- (AccessibilityFeatureCache)initWithCoder:(id)a3;
- (BOOL)assistiveTouch;
- (BOOL)backTap;
- (BOOL)liveCaptions;
- (BOOL)liveSpeech;
- (BOOL)speakScreen;
- (BOOL)voiceControl;
- (BOOL)zoom;
- (NSArray)tripleClickOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setAssistiveTouch:(BOOL)a3;
- (void)setBackTap:(BOOL)a3;
- (void)setLiveCaptions:(BOOL)a3;
- (void)setLiveSpeech:(BOOL)a3;
- (void)setSpeakScreen:(BOOL)a3;
- (void)setTripleClickOptions:(id)a3;
- (void)setVoiceControl:(BOOL)a3;
- (void)setZoom:(BOOL)a3;
@end

@implementation AccessibilityFeatureCache

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache speakScreen](self, "speakScreen"), @"speakScreen");
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache liveCaptions](self, "liveCaptions"), @"liveCaptions");
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache liveSpeech](self, "liveSpeech"), @"liveSpeech");
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache zoom](self, "zoom"), @"zoom");
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache voiceControl](self, "voiceControl"), @"voiceControl");
  objc_msgSend(v4, "encodeBool:forKey:", -[AccessibilityFeatureCache backTap](self, "backTap"), @"backTap");
  id v5 = [(AccessibilityFeatureCache *)self tripleClickOptions];
  [v4 encodeObject:v5 forKey:@"tripleClickOptions"];
}

- (AccessibilityFeatureCache)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AccessibilityFeatureCache;
  id v3 = a3;
  id v4 = [(AccessibilityFeatureCache *)&v7 init];
  -[AccessibilityFeatureCache setSpeakScreen:](v4, "setSpeakScreen:", objc_msgSend(v3, "decodeBoolForKey:", @"speakScreen", v7.receiver, v7.super_class));
  -[AccessibilityFeatureCache setLiveCaptions:](v4, "setLiveCaptions:", [v3 decodeBoolForKey:@"liveCaptions"]);
  -[AccessibilityFeatureCache setLiveSpeech:](v4, "setLiveSpeech:", [v3 decodeBoolForKey:@"liveSpeech"]);
  -[AccessibilityFeatureCache setZoom:](v4, "setZoom:", [v3 decodeBoolForKey:@"zoom"]);
  -[AccessibilityFeatureCache setVoiceControl:](v4, "setVoiceControl:", [v3 decodeBoolForKey:@"voiceControl"]);
  -[AccessibilityFeatureCache setBackTap:](v4, "setBackTap:", [v3 decodeBoolForKey:@"backTap"]);
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"tripleClickOptions"];

  [(AccessibilityFeatureCache *)v4 setTripleClickOptions:v5];
  return v4;
}

- (BOOL)speakScreen
{
  return self->_speakScreen;
}

- (void)setSpeakScreen:(BOOL)a3
{
  self->_speakScreen = a3;
}

- (BOOL)liveCaptions
{
  return self->_liveCaptions;
}

- (void)setLiveCaptions:(BOOL)a3
{
  self->_liveCaptions = a3;
}

- (BOOL)assistiveTouch
{
  return self->_assistiveTouch;
}

- (void)setAssistiveTouch:(BOOL)a3
{
  self->_assistiveTouch = a3;
}

- (BOOL)liveSpeech
{
  return self->_liveSpeech;
}

- (void)setLiveSpeech:(BOOL)a3
{
  self->_liveSpeech = a3;
}

- (BOOL)zoom
{
  return self->_zoom;
}

- (void)setZoom:(BOOL)a3
{
  self->_zoom = a3;
}

- (BOOL)voiceControl
{
  return self->_voiceControl;
}

- (void)setVoiceControl:(BOOL)a3
{
  self->_voiceControl = a3;
}

- (BOOL)backTap
{
  return self->_backTap;
}

- (void)setBackTap:(BOOL)a3
{
  self->_backTap = a3;
}

- (NSArray)tripleClickOptions
{
  return self->_tripleClickOptions;
}

- (void)setTripleClickOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end