@interface CFXPickerSession
- (BOOL)didModifyEffectsStack;
- (BOOL)didRemoveEffect;
- (BOOL)didScroll;
- (BOOL)isCompactPresentation;
- (BOOL)isExpandedPresentation;
- (CFXPickerSession)initWithIdentifier:(id)a3 isCompact:(BOOL)a4;
- (NSDate)lastCompactPresentationTime;
- (NSDate)lastExpandedPresentationTime;
- (NSDate)sessionStartTime;
- (NSDictionary)effectChangesDict;
- (NSString)pickerBundleIdentifier;
- (NSString)typeOfRemovedEffect;
- (double)compactPresentationDuration;
- (double)expandedPresentationDuration;
- (double)sessionDuration;
- (double)totalCompactPresentationDuration;
- (double)totalExpandedPresentationDuration;
- (void)didChangePresentationMode;
- (void)didDismiss;
- (void)didModifyEffectOfType:(id)a3 wasRemoval:(BOOL)a4;
- (void)setDidModifyEffectsStack:(BOOL)a3;
- (void)setDidRemoveEffect:(BOOL)a3;
- (void)setDidScroll:(BOOL)a3;
- (void)setLastCompactPresentationTime:(id)a3;
- (void)setLastExpandedPresentationTime:(id)a3;
- (void)setTotalCompactPresentationDuration:(double *)a3;
- (void)setTotalExpandedPresentationDuration:(double *)a3;
- (void)setTypeOfRemovedEffect:(id)a3;
@end

@implementation CFXPickerSession

- (CFXPickerSession)initWithIdentifier:(id)a3 isCompact:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CFXPickerSession;
  v8 = [(CFXPickerSession *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_pickerBundleIdentifier, a3);
    uint64_t v10 = [MEMORY[0x263EFF910] now];
    sessionStartTime = v9->_sessionStartTime;
    v9->_sessionStartTime = (NSDate *)v10;

    if (v4) {
      uint64_t v12 = 48;
    }
    else {
      uint64_t v12 = 56;
    }
    v9->_isCompactPresentation = v4;
    *(Class *)((char *)&v9->super.isa + v12) = (Class)(id)[MEMORY[0x263EFF910] now];
    *(_WORD *)&v9->_didModifyEffectsStack = 0;
    v9->_typeOfRemovedEffect = 0;
  }

  return v9;
}

- (double)sessionDuration
{
  v3 = [MEMORY[0x263EFF910] now];
  BOOL v4 = [(CFXPickerSession *)self sessionStartTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6;
}

- (BOOL)isExpandedPresentation
{
  return ![(CFXPickerSession *)self isCompactPresentation];
}

- (NSDictionary)effectChangesDict
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = objc_msgSend(NSNumber, "numberWithBool:", -[CFXPickerSession didModifyEffectsStack](self, "didModifyEffectsStack"));
  [v3 setObject:v4 forKeyedSubscript:@"DidChangeEffectsKey"];

  double v5 = objc_msgSend(NSNumber, "numberWithBool:", -[CFXPickerSession didRemoveEffect](self, "didRemoveEffect"));
  [v3 setObject:v5 forKeyedSubscript:@"DidRemoveEffectsKey"];

  double v6 = [(CFXPickerSession *)self typeOfRemovedEffect];

  if (v6)
  {
    id v7 = [(CFXPickerSession *)self typeOfRemovedEffect];
    [v3 setObject:v7 forKeyedSubscript:@"RemovedEffectTypeKey"];
  }
  return (NSDictionary *)v3;
}

- (void)didChangePresentationMode
{
  BOOL v3 = [(CFXPickerSession *)self isCompactPresentation];
  BOOL v4 = [MEMORY[0x263EFF910] now];
  if (v3)
  {
    double v5 = [(CFXPickerSession *)self lastCompactPresentationTime];
    [v4 timeIntervalSinceDate:v5];
    self->_compactPresentationDuration = v6 + self->_compactPresentationDuration;

    [(CFXPickerSession *)self setLastCompactPresentationTime:0];
    id v7 = [MEMORY[0x263EFF910] now];
    [(CFXPickerSession *)self setLastExpandedPresentationTime:v7];
    BOOL v8 = 0;
  }
  else
  {
    v9 = [(CFXPickerSession *)self lastExpandedPresentationTime];
    [v4 timeIntervalSinceDate:v9];
    self->_expandedPresentationDuration = v10 + self->_expandedPresentationDuration;

    [(CFXPickerSession *)self setLastExpandedPresentationTime:0];
    id v7 = [MEMORY[0x263EFF910] now];
    [(CFXPickerSession *)self setLastCompactPresentationTime:v7];
    BOOL v8 = 1;
  }

  self->_isCompactPresentation = v8;
}

- (void)didModifyEffectOfType:(id)a3 wasRemoval:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(CFXPickerSession *)self setDidModifyEffectsStack:1];
  if (([v7 isEqualToString:@"Filter"] & 1) != 0
    || [v7 isEqualToString:@"Animoji"])
  {
    [(CFXPickerSession *)self setDidRemoveEffect:v4];
    if (v4) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
    [(CFXPickerSession *)self setTypeOfRemovedEffect:v6];
  }
}

- (void)didDismiss
{
  BOOL v3 = [(CFXPickerSession *)self isCompactPresentation];
  id v7 = [MEMORY[0x263EFF910] now];
  if (v3)
  {
    BOOL v4 = [(CFXPickerSession *)self lastCompactPresentationTime];
    uint64_t v5 = 24;
  }
  else
  {
    BOOL v4 = [(CFXPickerSession *)self lastExpandedPresentationTime];
    uint64_t v5 = 32;
  }
  [v7 timeIntervalSinceDate:v4];
  *(double *)((char *)&self->super.isa + v5) = v6 + *(double *)((char *)&self->super.isa + v5);
}

- (NSString)pickerBundleIdentifier
{
  return self->_pickerBundleIdentifier;
}

- (BOOL)isCompactPresentation
{
  return self->_isCompactPresentation;
}

- (double)compactPresentationDuration
{
  return self->_compactPresentationDuration;
}

- (double)expandedPresentationDuration
{
  return self->_expandedPresentationDuration;
}

- (BOOL)didScroll
{
  return self->_didScroll;
}

- (void)setDidScroll:(BOOL)a3
{
  self->_didScroll = a3;
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (NSDate)lastCompactPresentationTime
{
  return self->_lastCompactPresentationTime;
}

- (void)setLastCompactPresentationTime:(id)a3
{
  self->_lastCompactPresentationTime = (NSDate *)a3;
}

- (NSDate)lastExpandedPresentationTime
{
  return self->_lastExpandedPresentationTime;
}

- (void)setLastExpandedPresentationTime:(id)a3
{
  self->_lastExpandedPresentationTime = (NSDate *)a3;
}

- (double)totalCompactPresentationDuration
{
  return self->_totalCompactPresentationDuration;
}

- (void)setTotalCompactPresentationDuration:(double *)a3
{
  self->_totalCompactPresentationDuration = a3;
}

- (double)totalExpandedPresentationDuration
{
  return self->_totalExpandedPresentationDuration;
}

- (void)setTotalExpandedPresentationDuration:(double *)a3
{
  self->_totalExpandedPresentationDuration = a3;
}

- (BOOL)didModifyEffectsStack
{
  return self->_didModifyEffectsStack;
}

- (void)setDidModifyEffectsStack:(BOOL)a3
{
  self->_didModifyEffectsStack = a3;
}

- (BOOL)didRemoveEffect
{
  return self->_didRemoveEffect;
}

- (void)setDidRemoveEffect:(BOOL)a3
{
  self->_didRemoveEffect = a3;
}

- (NSString)typeOfRemovedEffect
{
  return self->_typeOfRemovedEffect;
}

- (void)setTypeOfRemovedEffect:(id)a3
{
  self->_typeOfRemovedEffect = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_pickerBundleIdentifier, 0);
}

@end