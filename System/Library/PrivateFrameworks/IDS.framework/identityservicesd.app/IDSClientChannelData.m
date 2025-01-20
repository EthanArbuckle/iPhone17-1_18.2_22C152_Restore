@interface IDSClientChannelData
- ($7E5B20AA39B03BD07413883FE2814EDA)packetBuffer;
- (IDSClientChannelData)initWithBytesBuffer:(char *)a3 bufferSize:(unsigned int)a4 metadata:(const char *)a5 metadataSize:(unsigned int)a6;
- (IDSClientChannelData)initWithPacketBuffer:(id *)a3 metadata:(const char *)a4 metadataSize:(unsigned int)a5;
- (const)metadata;
- (unsigned)metadataSize;
- (void)dealloc;
@end

@implementation IDSClientChannelData

- (IDSClientChannelData)initWithBytesBuffer:(char *)a3 bufferSize:(unsigned int)a4 metadata:(const char *)a5 metadataSize:(unsigned int)a6
{
  v17.receiver = self;
  v17.super_class = (Class)IDSClientChannelData;
  v10 = [(IDSClientChannelData *)&v17 init];
  if (v10)
  {
    if (a3)
    {
      v11 = (void **)_IDSLinkPacketBufferCreate();
      v10->_packetBuffer = ($7E5B20AA39B03BD07413883FE2814EDA *)v11;
      memcpy(*v11, a3, a4);
      packetBuffer = v10->_packetBuffer;
      packetBuffer->var2 = a4;
      memcpy(&packetBuffer->var0[a4], a5, a6);
      v13 = &v10->_packetBuffer->var0[v10->_packetBuffer->var2];
    }
    else
    {
      v14 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:a5 length:a6];
      metadataData = v10->_metadataData;
      v10->_metadataData = v14;

      v13 = [(NSData *)v10->_metadataData bytes];
    }
    v10->_metadata = v13;
    v10->_metadataSize = a6;
  }
  return v10;
}

- (IDSClientChannelData)initWithPacketBuffer:(id *)a3 metadata:(const char *)a4 metadataSize:(unsigned int)a5
{
  v16.receiver = self;
  v16.super_class = (Class)IDSClientChannelData;
  v8 = [(IDSClientChannelData *)&v16 init];
  if (v8)
  {
    if (a3)
    {
      v9 = (void **)_IDSLinkPacketBufferCreate();
      v8->_packetBuffer = ($7E5B20AA39B03BD07413883FE2814EDA *)v9;
      memcpy(*v9, a3->var0, a3->var2);
      int64_t var2 = a3->var2;
      packetBuffer = v8->_packetBuffer;
      packetBuffer->int64_t var2 = var2;
      memcpy(&packetBuffer->var0[var2], a4, a5);
      v12 = &v8->_packetBuffer->var0[v8->_packetBuffer->var2];
    }
    else
    {
      v13 = (NSData *)[objc_alloc((Class)NSData) initWithBytes:a4 length:a5];
      metadataData = v8->_metadataData;
      v8->_metadataData = v13;

      v12 = [(NSData *)v8->_metadataData bytes];
    }
    v8->_metadata = v12;
    v8->_metadataSize = a5;
  }
  return v8;
}

- (void)dealloc
{
  _IDSLinkPacketBufferRelease();
  v3.receiver = self;
  v3.super_class = (Class)IDSClientChannelData;
  [(IDSClientChannelData *)&v3 dealloc];
}

- ($7E5B20AA39B03BD07413883FE2814EDA)packetBuffer
{
  return self->_packetBuffer;
}

- (const)metadata
{
  return self->_metadata;
}

- (unsigned)metadataSize
{
  return self->_metadataSize;
}

- (void).cxx_destruct
{
}

@end