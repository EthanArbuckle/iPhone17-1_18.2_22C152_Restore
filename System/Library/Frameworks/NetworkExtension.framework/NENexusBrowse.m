@interface NENexusBrowse
- (NSUUID)clientIdentifier;
- (NWBrowseDescriptor)descriptor;
- (NWParameters)parameters;
- (void)setClientIdentifier:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation NENexusBrowse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_parameters, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSUUID)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setParameters:(id)a3
{
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (void)setDescriptor:(id)a3
{
}

- (NWBrowseDescriptor)descriptor
{
  return self->_descriptor;
}

@end