@interface CDRichComplicationTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (BOOL)templateWantsPlatter;
- (CLKComplicationTemplate)template;
- (id)complicationTemplate;
- (int64_t)tritiumUpdateMode;
- (unint64_t)timelineAnimationFadeTypeOverride;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
- (void)setTemplateWantsPlatter:(BOOL)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
@end

@implementation CDRichComplicationTemplateView

- (int64_t)tritiumUpdateMode
{
  return 2;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 1;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_template, a3);
  v7 = [v11 metadata];
  v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFCF80]];
  if (v8)
  {
    self->_templateWantsPlatter = 1;
  }
  else
  {
    v9 = [v11 metadata];
    v10 = [v9 objectForKeyedSubscript:*MEMORY[0x263EFCF78]];
    self->_templateWantsPlatter = v10 != 0;
  }
  [(CDRichComplicationTemplateView *)self _handleTemplate:v11 reason:a4];
  [(CDRichComplicationTemplateView *)self setNeedsLayout];
}

- (id)complicationTemplate
{
  return self->_template;
}

- (unint64_t)timelineAnimationFadeTypeOverride
{
  v2 = [(CLKComplicationTemplate *)self->_template metadata];
  v3 = [v2 objectForKeyedSubscript:@"NTKComplicationTimelineAnimationFadeType"];

  if (v3) {
    unint64_t v4 = [v3 integerValue];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CDRichComplicationTemplateView;
  [(CDRichComplicationView *)&v6 setTimeTravelDate:a3 animated:a4];
  v5 = self->_template;
  if (v5) {
    [(CDRichComplicationTemplateView *)self setComplicationTemplate:v5 reason:0];
  }
}

- (CLKComplicationTemplate)template
{
  return self->_template;
}

- (BOOL)templateWantsPlatter
{
  return self->_templateWantsPlatter;
}

- (void)setTemplateWantsPlatter:(BOOL)a3
{
  self->_templateWantsPlatter = a3;
}

- (void).cxx_destruct
{
}

@end