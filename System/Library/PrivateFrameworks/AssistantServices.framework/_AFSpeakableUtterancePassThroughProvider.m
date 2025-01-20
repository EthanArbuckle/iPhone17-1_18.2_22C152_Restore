@interface _AFSpeakableUtterancePassThroughProvider
- (id)stringForExpression:(id)a3;
- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4;
@end

@implementation _AFSpeakableUtterancePassThroughProvider

- (id)stringForExpression:(id)a3 containsPrivacySensitiveContents:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
  v4 = (void *)[a3 copy];
  return v4;
}

- (id)stringForExpression:(id)a3
{
  return [(_AFSpeakableUtterancePassThroughProvider *)self stringForExpression:a3 containsPrivacySensitiveContents:0];
}

@end