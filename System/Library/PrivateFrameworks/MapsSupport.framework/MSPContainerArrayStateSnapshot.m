@interface MSPContainerArrayStateSnapshot
- (MSPContainerArrayStateSnapshot)init;
- (MSPContainerArrayStateSnapshot)initWithContents:(id)a3;
- (MSPContainerArrayStateSnapshot)initWithContents:(id)a3 clientIdentifier:(id)a4;
- (NSArray)contents;
- (NSString)description;
- (NSUUID)clientIdentifier;
- (void)setClientIdentifier:(id)a3;
@end

@implementation MSPContainerArrayStateSnapshot

- (MSPContainerArrayStateSnapshot)init
{
  return [(MSPContainerArrayStateSnapshot *)self initWithContents:MEMORY[0x1E4F1CBF0]];
}

- (MSPContainerArrayStateSnapshot)initWithContents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSPContainerArrayStateSnapshot;
  v5 = [(MSPContainerArrayStateSnapshot *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contents = v5->_contents;
    v5->_contents = (NSArray *)v6;
  }
  return v5;
}

- (MSPContainerArrayStateSnapshot)initWithContents:(id)a3 clientIdentifier:(id)a4
{
  id v7 = a4;
  v8 = [(MSPContainerArrayStateSnapshot *)self initWithContents:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_clientIdentifier, a4);
  }

  return v9;
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPContainerArrayStateSnapshot;
  id v4 = [(MSPContainerArrayStateSnapshot *)&v8 description];
  v5 = [(MSPContainerArrayStateSnapshot *)self contents];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ - %@>", v4, v5];

  return (NSString *)v6;
}

- (NSArray)contents
{
  return self->_contents;
}

- (NSUUID)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);

  objc_storeStrong((id *)&self->_contents, 0);
}

@end