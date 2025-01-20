@interface SCATMIDIInputSource
- (AXMIDIManager)midiManager;
- (BOOL)isMIDIInputSource;
- (SCATMIDIInputSource)init;
- (id)switchSource;
- (int64_t)_switchKeyForEvent:(id)a3;
- (int64_t)switchKeyForSwitch:(id)a3;
- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 endpoint:(id)a6;
- (void)setMidiManager:(id)a3;
@end

@implementation SCATMIDIInputSource

- (SCATMIDIInputSource)init
{
  v13.receiver = self;
  v13.super_class = (Class)SCATMIDIInputSource;
  v2 = [(SCATInputSource *)&v13 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = objc_alloc((Class)AXMIDIManager);
    v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    v9 = sub_1000E1BB0;
    v10 = &unk_1001AE938;
    objc_copyWeak(&v11, &location);
    v4 = (AXMIDIManager *)[v3 initWithIdentifier:@"SwitchControl" eventHandler:&v7];
    midiManager = v2->_midiManager;
    v2->_midiManager = v4;

    [(AXMIDIManager *)v2->_midiManager printAttachedDevices];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (int64_t)_switchKeyForEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 channel];
  unsigned int v5 = [v3 note];

  return v5 | (unint64_t)(v4 << 8);
}

- (void)_handleMIDIEvent:(id)a3 device:(id)a4 entity:(id)a5 endpoint:(id)a6
{
  id v7 = a3;
  id v6 = v7;
  AXPerformBlockOnMainThread();
}

- (BOOL)isMIDIInputSource
{
  return 1;
}

- (id)switchSource
{
  return SCATSwitchSourceMIDI;
}

- (int64_t)switchKeyForSwitch:(id)a3
{
  uint64_t v4 = [a3 midiEvent];
  int64_t v5 = [(SCATMIDIInputSource *)self _switchKeyForEvent:v4];

  return v5;
}

- (AXMIDIManager)midiManager
{
  return self->_midiManager;
}

- (void)setMidiManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end