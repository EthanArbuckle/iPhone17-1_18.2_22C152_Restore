@interface MPMusicPlayerPlayParametersQueueDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (MPMusicPlayerPlayParameters)startItemPlayParameters;
- (MPMusicPlayerPlayParametersQueueDescriptor)initWithCoder:(id)a3;
- (MPMusicPlayerPlayParametersQueueDescriptor)initWithPlayParametersQueue:(NSArray *)playParametersQueue;
- (NSArray)playParametersQueue;
- (id)containerPlayParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setContainerPlayParameters:(id)a3;
- (void)setEndTime:(NSTimeInterval)endTime forItemWithPlayParameters:(MPMusicPlayerPlayParameters *)playParameters;
- (void)setPlayParametersQueue:(NSArray *)playParametersQueue;
- (void)setStartItemPlayParameters:(MPMusicPlayerPlayParameters *)startItemPlayParameters;
- (void)setStartTime:(NSTimeInterval)startTime forItemWithPlayParameters:(MPMusicPlayerPlayParameters *)playParameters;
@end

@implementation MPMusicPlayerPlayParametersQueueDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPlayParameters, 0);
  objc_storeStrong((id *)&self->_startItemPlayParameters, 0);

  objc_storeStrong((id *)&self->_playParametersQueue, 0);
}

- (void)setStartItemPlayParameters:(MPMusicPlayerPlayParameters *)startItemPlayParameters
{
}

- (MPMusicPlayerPlayParameters)startItemPlayParameters
{
  return self->_startItemPlayParameters;
}

- (void)setPlayParametersQueue:(NSArray *)playParametersQueue
{
}

- (id)containerPlayParameters
{
  return self->_containerPlayParameters;
}

- (void)setContainerPlayParameters:(id)a3
{
  v4 = (MPMusicPlayerPlayParameters *)[a3 copy];
  containerPlayParameters = self->_containerPlayParameters;
  self->_containerPlayParameters = v4;
}

- (BOOL)isEmpty
{
  return [(NSArray *)self->_playParametersQueue count] == 0;
}

- (NSArray)playParametersQueue
{
  v2 = (void *)[(NSArray *)self->_playParametersQueue copy];

  return (NSArray *)v2;
}

- (void)setEndTime:(NSTimeInterval)endTime forItemWithPlayParameters:(MPMusicPlayerPlayParameters *)playParameters
{
  id v6 = [(MPMusicPlayerPlayParameters *)playParameters identifiers];
  [(MPMusicPlayerQueueDescriptor *)self _setEndTime:v6 forIdentifiers:endTime];
}

- (void)setStartTime:(NSTimeInterval)startTime forItemWithPlayParameters:(MPMusicPlayerPlayParameters *)playParameters
{
  id v6 = [(MPMusicPlayerPlayParameters *)playParameters identifiers];
  [(MPMusicPlayerQueueDescriptor *)self _setStartTime:v6 forIdentifiers:startTime];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p queue=%@ startItem=%@ container: %@>", objc_opt_class(), self, self->_playParametersQueue, self->_startItemPlayParameters, self->_containerPlayParameters];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  v4 = [(MPMusicPlayerQueueDescriptor *)&v12 copyWithZone:a3];
  uint64_t v5 = [(NSArray *)self->_playParametersQueue copy];
  id v6 = (void *)v4[11];
  v4[11] = v5;

  uint64_t v7 = [(MPMusicPlayerPlayParameters *)self->_startItemPlayParameters copy];
  v8 = (void *)v4[12];
  v4[12] = v7;

  uint64_t v9 = [(MPMusicPlayerPlayParameters *)self->_containerPlayParameters copy];
  v10 = (void *)v4[13];
  v4[13] = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  id v4 = a3;
  [(MPMusicPlayerQueueDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_playParametersQueue, @"MPMusicPlayerPlayParametersQueueDescriptorPlayParameters", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_startItemPlayParameters forKey:@"MPMusicPlayerPlayParametersQueueDescriptorStartItemPlayParameters"];
  [v4 encodeObject:self->_containerPlayParameters forKey:@"MPMusicPlayerPlayParametersQueueDescriptorContainerPlayParameters"];
}

- (MPMusicPlayerPlayParametersQueueDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v16 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPMusicPlayerPlayParametersQueueDescriptorPlayParameters"];
    playParametersQueue = v5->_playParametersQueue;
    v5->_playParametersQueue = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersQueueDescriptorStartItemPlayParameters"];
    startItemPlayParameters = v5->_startItemPlayParameters;
    v5->_startItemPlayParameters = (MPMusicPlayerPlayParameters *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPMusicPlayerPlayParametersQueueDescriptorContainerPlayParameters"];
    containerPlayParameters = v5->_containerPlayParameters;
    v5->_containerPlayParameters = (MPMusicPlayerPlayParameters *)v13;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  if ([(MPMusicPlayerQueueDescriptor *)&v20 isEqual:v4])
  {
    objc_super v5 = v4;
    id v6 = (NSArray *)v5[11];
    uint64_t v7 = self->_playParametersQueue;
    v8 = v7;
    if (v7 == v6) {
      char v9 = 1;
    }
    else {
      char v9 = [(NSArray *)v7 isEqual:v6];
    }

    uint64_t v11 = (MPMusicPlayerPlayParameters *)v5[12];
    objc_super v12 = self->_startItemPlayParameters;
    uint64_t v13 = v12;
    if (v12 == v11) {
      char v14 = 1;
    }
    else {
      char v14 = [(MPMusicPlayerPlayParameters *)v12 isEqual:v11];
    }

    v15 = (MPMusicPlayerPlayParameters *)v5[13];
    objc_super v16 = self->_containerPlayParameters;
    v17 = v16;
    if (v16 == v15) {
      char v18 = 1;
    }
    else {
      char v18 = [(MPMusicPlayerPlayParameters *)v16 isEqual:v15];
    }

    char v10 = v9 & v14 & v18;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (MPMusicPlayerPlayParametersQueueDescriptor)initWithPlayParametersQueue:(NSArray *)playParametersQueue
{
  id v4 = playParametersQueue;
  v9.receiver = self;
  v9.super_class = (Class)MPMusicPlayerPlayParametersQueueDescriptor;
  objc_super v5 = [(MPMusicPlayerQueueDescriptor *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [(NSArray *)v4 copy];
    uint64_t v7 = v5->_playParametersQueue;
    v5->_playParametersQueue = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end