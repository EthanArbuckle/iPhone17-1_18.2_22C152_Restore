@interface MIDICIProfileState
+ (BOOL)supportsSecureCoding;
+ (id)description;
- (MIDICIProfileState)initWithChannel:(MIDIChannelNumber)midiChannelNum enabledProfiles:(NSArray *)enabled disabledProfiles:(NSArray *)disabled;
- (MIDICIProfileState)initWithCoder:(id)a3;
- (MIDICIProfileState)initWithEnabledProfiles:(NSArray *)enabled disabledProfiles:(NSArray *)disabled;
- (MIDIChannelNumber)midiChannel;
- (NSArray)disabledProfiles;
- (NSArray)enabledProfiles;
- (id)bytesWithChannel:(unsigned __int8)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)updateWithEnabledProfiles:(id)a3 disabledProfiles:(id)a4;
@end

@implementation MIDICIProfileState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->disabledProfiles, 0);

  objc_storeStrong((id *)&self->enabledProfiles, 0);
}

- (NSArray)disabledProfiles
{
  return self->disabledProfiles;
}

- (NSArray)enabledProfiles
{
  return self->enabledProfiles;
}

- (MIDIChannelNumber)midiChannel
{
  return self->midiChannel;
}

- (id)bytesWithChannel:(unsigned __int8)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v28 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  char v27 = [(NSArray *)self->enabledProfiles count];
  char v26 = [(NSArray *)self->disabledProfiles count];
  [v4 appendBytes:&v28 length:1];
  [v4 appendBytes:&v27 length:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v5 = self->enabledProfiles;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        id v10 = [v9 profileID];
        objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v10, "bytes"), 5);
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  [v4 appendBytes:&v26 length:1];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = self->disabledProfiles;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(id *)(*((void *)&v18 + 1) + 8 * j);
        objc_msgSend(v15, "profileID", (void)v18);
        id v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendBytes:length:", objc_msgSend(v16, "bytes"), 5);
      }
      uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v12);
  }

  return v4;
}

- (void)updateWithEnabledProfiles:(id)a3 disabledProfiles:(id)a4
{
  uint64_t v6 = (NSArray *)a3;
  uint64_t v7 = (NSArray *)a4;
  enabledProfiles = self->enabledProfiles;
  self->enabledProfiles = v6;
  id v10 = v6;

  disabledProfiles = self->disabledProfiles;
  self->disabledProfiles = v7;
}

- (id)description
{
  disabledProfiles = (NSArray *)@"NONE";
  enabledProfiles = self->enabledProfiles;
  if (!enabledProfiles) {
    enabledProfiles = (NSArray *)@"NONE";
  }
  if (self->disabledProfiles) {
    disabledProfiles = self->disabledProfiles;
  }
  return (id)[NSString stringWithFormat:@"<MIDICIProfileState(%p) midiChannel:0x%x enabledProfiles: %@ disabledProfiles: %@>", self, self->midiChannel, enabledProfiles, disabledProfiles];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->midiChannel forKey:@"midiChannel"];
  [v4 encodeObject:self->enabledProfiles forKey:@"enabledProfiles"];
  [v4 encodeObject:self->disabledProfiles forKey:@"disabledProfiles"];
}

- (MIDICIProfileState)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MIDICIProfileState;
  v5 = [(MIDICIProfileState *)&v19 init];
  if (v5)
  {
    v5->midiChannel = [v4 decodeIntForKey:@"midiChannel"];
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = self;
    v8 = self;
    id v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"enabledProfiles"];
    enabledProfiles = v5->enabledProfiles;
    v5->enabledProfiles = (NSArray *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = self;
    v14 = self;
    id v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"disabledProfiles"];
    disabledProfiles = v5->disabledProfiles;
    v5->disabledProfiles = (NSArray *)v16;
  }
  return v5;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MIDICIProfileState;
  [(MIDICIProfileState *)&v2 dealloc];
}

- (MIDICIProfileState)initWithChannel:(MIDIChannelNumber)midiChannelNum enabledProfiles:(NSArray *)enabled disabledProfiles:(NSArray *)disabled
{
  id v9 = enabled;
  uint64_t v10 = disabled;
  v14.receiver = self;
  v14.super_class = (Class)MIDICIProfileState;
  v11 = [(MIDICIProfileState *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->midiChannel = midiChannelNum;
    objc_storeStrong((id *)&v11->enabledProfiles, enabled);
    objc_storeStrong((id *)&v12->disabledProfiles, disabled);
  }

  return v12;
}

- (MIDICIProfileState)initWithEnabledProfiles:(NSArray *)enabled disabledProfiles:(NSArray *)disabled
{
  return 0;
}

+ (id)description
{
  return @"MIDI-CI Profile State";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end