@interface ComponentAccessoryMiniJack
- (BOOL)isPresent;
@end

@implementation ComponentAccessoryMiniJack

- (BOOL)isPresent
{
  v2 = +[AVAudioSession sharedInstance];
  v3 = [v2 currentRoute];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [v3 outputs];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) portType];
        v7 |= [v10 isEqualToString:AVAudioSessionPortHeadphones];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7 & 1;
}

@end