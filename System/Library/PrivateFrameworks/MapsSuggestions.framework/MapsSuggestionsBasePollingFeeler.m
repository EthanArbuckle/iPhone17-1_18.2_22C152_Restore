@interface MapsSuggestionsBasePollingFeeler
- (double)updateSignals;
- (int64_t)disposition;
@end

@implementation MapsSuggestionsBasePollingFeeler

- (int64_t)disposition
{
  return 1;
}

- (double)updateSignals
{
  [(MapsSuggestionsBasePollingFeeler *)self doesNotRecognizeSelector:a2];
  __break(1u);
  return result;
}

@end