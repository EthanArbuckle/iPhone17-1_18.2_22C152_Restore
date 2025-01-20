@interface AVAudioSemantics
+ (BOOL)supportsSecureCoding;
- (AVAudioSemantics)init;
- (AVAudioSemantics)initWithAudioSemantics:(__CFArray *)a3;
- (AVAudioSemantics)initWithChannelGroups:(id)a3;
- (AVAudioSemantics)initWithCoder:(id)a3;
- (NSArray)channelGroups;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelGroups:(id)a3;
@end

@implementation AVAudioSemantics

- (void).cxx_destruct
{
}

- (void)setChannelGroups:(id)a3
{
}

- (NSArray)channelGroups
{
  return self->_channelGroups;
}

- (void)encodeWithCoder:(id)a3
{
}

- (AVAudioSemantics)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSemantics;
  v5 = [(AVAudioSemantics *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"channelGroups"];
    channelGroups = v5->_channelGroups;
    v5->_channelGroups = (NSArray *)v6;
  }
  return v5;
}

- (AVAudioSemantics)initWithAudioSemantics:(__CFArray *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)AVAudioSemantics;
  id v4 = [(AVAudioSemantics *)&v20 init];
  if (v4)
  {
    v5 = a3;
    uint64_t v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[__CFArray count](v5, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = v5;
    uint64_t v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
          v12 = [AVAudioChannelGroupSemantics alloc];
          v13 = -[AVAudioChannelGroupSemantics initWithAudioChannelGroupSemantics:](v12, "initWithAudioChannelGroupSemantics:", v11, (void)v16);
          [(NSArray *)v6 addObject:v13];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(__CFArray *)v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    channelGroups = v4->_channelGroups;
    v4->_channelGroups = v6;
  }
  return v4;
}

- (AVAudioSemantics)initWithChannelGroups:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVAudioSemantics;
  uint64_t v6 = [(AVAudioSemantics *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_channelGroups, a3);
  }

  return v7;
}

- (AVAudioSemantics)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end