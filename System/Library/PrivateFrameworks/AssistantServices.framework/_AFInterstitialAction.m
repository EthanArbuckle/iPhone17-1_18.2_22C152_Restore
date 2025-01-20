@interface _AFInterstitialAction
- (NSString)displayKey;
- (NSString)speakableKey;
- (_AFInterstitialAction)initWithDuration:(double)a3;
- (_AFInterstitialAction)initWithPhase:(int64_t)a3 displayKey:(id)a4 speakableKey:(id)a5;
- (double)duration;
- (int64_t)phase;
@end

@implementation _AFInterstitialAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableKey, 0);
  objc_storeStrong((id *)&self->_displayKey, 0);
}

- (double)duration
{
  return self->_duration;
}

- (NSString)speakableKey
{
  return self->_speakableKey;
}

- (NSString)displayKey
{
  return self->_displayKey;
}

- (int64_t)phase
{
  return self->_phase;
}

- (_AFInterstitialAction)initWithDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_AFInterstitialAction;
  result = [(_AFInterstitialAction *)&v5 init];
  if (result) {
    result->_duration = a3;
  }
  return result;
}

- (_AFInterstitialAction)initWithPhase:(int64_t)a3 displayKey:(id)a4 speakableKey:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_AFInterstitialAction;
  v10 = [(_AFInterstitialAction *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_phase = a3;
    uint64_t v12 = [v8 copy];
    displayKey = v11->_displayKey;
    v11->_displayKey = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    speakableKey = v11->_speakableKey;
    v11->_speakableKey = (NSString *)v14;
  }
  return v11;
}

@end