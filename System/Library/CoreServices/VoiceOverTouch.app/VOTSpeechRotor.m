@interface VOTSpeechRotor
- (VOTSpeechRotor)init;
@end

@implementation VOTSpeechRotor

- (VOTSpeechRotor)init
{
  v8.receiver = self;
  v8.super_class = (Class)VOTSpeechRotor;
  v2 = [(VOTRotor *)&v8 init];
  v3 = v2;
  if (v2)
  {
    j__CFArrayAppendValue(v2->super._currentRotors, (const void *)0x51);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x52);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x56);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x53);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x57);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x54);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x55);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x58);
    j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x59);
    v4 = +[VOTOutputManager outputManager];
    unsigned int v5 = [v4 externalAudioRouteSelected];

    if (v5) {
      j__CFArrayAppendValue(v3->super._currentRotors, (const void *)0x5A);
    }
    v6 = v3;
  }

  return v3;
}

@end