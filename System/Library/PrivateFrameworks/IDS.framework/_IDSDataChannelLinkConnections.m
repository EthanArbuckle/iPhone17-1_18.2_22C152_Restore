@interface _IDSDataChannelLinkConnections
- (BOOL)isQUICPod;
- (_IDSDataChannelLinkConnection)qpod;
- (_IDSDataChannelLinkConnection)udp;
- (id)description;
- (void)setQpod:(id)a3;
- (void)setUdp:(id)a3;
@end

@implementation _IDSDataChannelLinkConnections

- (id)description
{
  v3 = NSString;
  v4 = [(_IDSDataChannelLinkConnections *)self udp];
  v5 = [(_IDSDataChannelLinkConnections *)self qpod];
  v6 = [v3 stringWithFormat:@"<_IDSDataChannelLinkConnections\n    udp: %@\n    qpod: %@\n>", v4, v5];

  return v6;
}

- (BOOL)isQUICPod
{
  v3 = [(_IDSDataChannelLinkConnections *)self qpod];
  if (v3)
  {
    v4 = [(_IDSDataChannelLinkConnections *)self qpod];
    char v5 = [v4 allowOutgoing];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (_IDSDataChannelLinkConnection)udp
{
  return (_IDSDataChannelLinkConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUdp:(id)a3
{
}

- (_IDSDataChannelLinkConnection)qpod
{
  return (_IDSDataChannelLinkConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQpod:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qpod, 0);

  objc_storeStrong((id *)&self->_udp, 0);
}

@end