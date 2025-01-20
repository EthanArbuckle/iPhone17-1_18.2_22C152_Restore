@interface HFAnalyticsSceneIconEditEvent
- (HFAnalyticsSceneIconEditEvent)initWithData:(id)a3;
- (NSNumber)didChange;
- (NSNumber)isNewScene;
- (NSString)colorStr;
- (NSString)sfSymbolStr;
- (id)payload;
- (void)setColorStr:(id)a3;
- (void)setDidChange:(id)a3;
- (void)setIsNewScene:(id)a3;
- (void)setSfSymbolStr:(id)a3;
@end

@implementation HFAnalyticsSceneIconEditEvent

- (HFAnalyticsSceneIconEditEvent)initWithData:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HFAnalyticsSceneIconEditEvent;
  v5 = [(HFAnalyticsEvent *)&v15 initWithEventType:38];
  if (v5)
  {
    objc_opt_class();
    v6 = [v4 objectForKeyedSubscript:@"sceneIconDidChange"];
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    objc_storeStrong((id *)&v5->_didChange, v7);

    objc_opt_class();
    v8 = [v4 objectForKeyedSubscript:@"sceneIconColorDescription"];
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    objc_storeStrong((id *)&v5->_colorStr, v9);

    objc_opt_class();
    v10 = [v4 objectForKeyedSubscript:@"sceneIconIdentifier"];
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    objc_storeStrong((id *)&v5->_sfSymbolStr, v11);

    objc_opt_class();
    v12 = [v4 objectForKeyedSubscript:@"isNewScene"];
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    objc_storeStrong((id *)&v5->_isNewScene, v13);
  }
  return v5;
}

- (id)payload
{
  v10.receiver = self;
  v10.super_class = (Class)HFAnalyticsSceneIconEditEvent;
  v3 = [(HFAnalyticsEvent *)&v10 payload];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HFAnalyticsSceneIconEditEvent *)self didChange];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, @"sceneIconEditDidChange");

  v6 = [(HFAnalyticsSceneIconEditEvent *)self colorStr];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, @"sceneIconEditColorString");

  v7 = [(HFAnalyticsSceneIconEditEvent *)self sfSymbolStr];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, @"sceneIconEditSFSymbolString");

  v8 = [(HFAnalyticsSceneIconEditEvent *)self isNewScene];
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, @"isNewScene");

  [v4 setObject:&unk_26C0F7AB8 forKeyedSubscript:@"homeAppEventCount"];
  return v4;
}

- (NSNumber)didChange
{
  return self->_didChange;
}

- (void)setDidChange:(id)a3
{
}

- (NSString)colorStr
{
  return self->_colorStr;
}

- (void)setColorStr:(id)a3
{
}

- (NSString)sfSymbolStr
{
  return self->_sfSymbolStr;
}

- (void)setSfSymbolStr:(id)a3
{
}

- (NSNumber)isNewScene
{
  return self->_isNewScene;
}

- (void)setIsNewScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isNewScene, 0);
  objc_storeStrong((id *)&self->_sfSymbolStr, 0);
  objc_storeStrong((id *)&self->_colorStr, 0);
  objc_storeStrong((id *)&self->_didChange, 0);
}

@end