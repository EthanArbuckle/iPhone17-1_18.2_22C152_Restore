@interface HFSignificantTimeEventBuilder
- (HFSignificantTimeEventBuilder)initWithEvent:(id)a3;
- (NSDateComponents)significantEventOffset;
- (NSString)description;
- (NSString)significantEvent;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)eventType;
- (id)naturalLanguageNameOfType:(unint64_t)a3 withHome:(id)a4 recurrences:(id)a5;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)naturalLanguageNameWithOptions:(id)a3 recurrences:(id)a4;
- (id)performValidation;
- (void)setSignificantEvent:(id)a3;
- (void)setSignificantEventOffset:(id)a3;
@end

@implementation HFSignificantTimeEventBuilder

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFSignificantTimeEventBuilder;
  v5 = [(HFEventBuilder *)&v13 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    v6 = [(HFSignificantTimeEventBuilder *)self significantEvent];
    v7 = [v4 significantEvent];
    v8 = +[HFPropertyDifference compareObjectA:v6 toObjectB:v7 key:@"significantEvent" priority:3];
    [v5 add:v8];

    v9 = [(HFSignificantTimeEventBuilder *)self significantEventOffset];
    v10 = [v4 significantEventOffset];
    v11 = +[HFPropertyDifference compareObjectA:v9 toObjectB:v10 key:@"significantEventOffset" priority:2];
    [v5 add:v11];
  }
  return v5;
}

- (HFSignificantTimeEventBuilder)initWithEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFSignificantTimeEventBuilder;
  v5 = [(HFEventBuilder *)&v9 initWithEvent:v4];
  if (v5)
  {
    v6 = [v4 significantEvent];
    [(HFSignificantTimeEventBuilder *)v5 setSignificantEvent:v6];

    v7 = [v4 offset];
    [(HFSignificantTimeEventBuilder *)v5 setSignificantEventOffset:v7];
  }
  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = objc_alloc(MEMORY[0x263F0E788]);
  v5 = [(HFSignificantTimeEventBuilder *)self significantEvent];
  v6 = [(HFSignificantTimeEventBuilder *)self significantEventOffset];
  v7 = (void *)[v4 initWithSignificantEvent:v5 offset:v6];
  v8 = [v3 setWithObject:v7];

  return v8;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3 withHome:(id)a4 recurrences:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[HFTriggerNaturalLanguageOptions alloc] initWithHome:v9 nameType:a3];

  v11 = [(HFSignificantTimeEventBuilder *)self naturalLanguageNameWithOptions:v10 recurrences:v8];

  return v11;
}

- (id)naturalLanguageNameWithOptions:(id)a3 recurrences:(id)a4
{
  v6 = (void *)MEMORY[0x263F0E860];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFSignificantTimeEventBuilder *)self significantEvent];
  v10 = [(HFSignificantTimeEventBuilder *)self significantEventOffset];
  v11 = objc_msgSend(v6, "hf_naturalLanguageNameWithOptions:significantEvent:offset:recurrences:", v8, v9, v10, v7);

  return v11;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  return [(HFSignificantTimeEventBuilder *)self naturalLanguageNameWithOptions:a3 recurrences:MEMORY[0x263EFFA68]];
}

- (id)performValidation
{
  v2 = [(HFSignificantTimeEventBuilder *)self significantEvent];

  v3 = (void *)MEMORY[0x263F58190];
  if (v2)
  {
    id v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v4 = [v3 futureWithError:v5];
  }
  return v4;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFSignificantTimeEventBuilder *)self significantEvent];
  [v3 appendString:v4 withName:@"significantEvent"];

  v5 = [(HFSignificantTimeEventBuilder *)self significantEventOffset];
  id v6 = (id)[v3 appendObject:v5 withName:@"offset"];

  id v7 = [v3 build];

  return (NSString *)v7;
}

- (id)eventType
{
  return @"HFEventTypeTime";
}

- (id)comparisonKey
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HFSignificantTimeEventBuilder;
  id v4 = [(HFEventBuilder *)&v9 comparisonKey];
  v5 = [(HFSignificantTimeEventBuilder *)self significantEvent];
  id v6 = [(HFSignificantTimeEventBuilder *)self significantEventOffset];
  id v7 = [v3 stringWithFormat:@"%@-%@:%@", v4, v5, v6];

  return v7;
}

- (NSString)significantEvent
{
  return self->_significantEvent;
}

- (void)setSignificantEvent:(id)a3
{
}

- (NSDateComponents)significantEventOffset
{
  return self->_significantEventOffset;
}

- (void)setSignificantEventOffset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantEventOffset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

@end