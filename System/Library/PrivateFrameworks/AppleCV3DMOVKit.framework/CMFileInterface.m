@interface CMFileInterface
+ (BOOL)writeContainerToFileURL:(id)a3 container:(id)a4;
+ (void)updateCV3DVersion:(id)a3 container:(id)a4;
+ (void)updateCVPlayerVersion:(id)a3 container:(id)a4;
+ (void)updateSessionID:(id)a3 container:(id)a4;
- (BOOL)saveToFileURL:(id)a3;
- (id)cv3dVersion;
- (id)cvPlayerVersion;
- (id)deviceString;
- (id)grabNextEvent;
- (id)grabNextRecvData;
- (id)grabNextRecvMessage;
- (id)grabNextSentData;
- (id)grabNextSentMessage;
- (id)iOSVersion;
- (id)initReaderWithFileURL:(id)a3;
- (id)initWriter;
- (id)macOSVersion;
- (id)sessionID;
- (id)version;
- (void)processCMData:(id)a3;
- (void)processCMData:(id)a3 sending:(BOOL)a4;
- (void)resetReader;
- (void)updateCV3DVersion:(id)a3;
- (void)updateCVPlayerVersion:(id)a3;
- (void)updateSessionID:(id)a3;
@end

@implementation CMFileInterface

- (id)initReaderWithFileURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CMFileInterface;
  v5 = [(CMFileInterface *)&v11 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v4];
  if (v6)
  {
    v7 = +[CMDataContainer classes];
    uint64_t v8 = +[CVAMetadataWrapper decodeNSCoderObject:v6 classes:v7];
    cmDataContainer = v5->_cmDataContainer;
    v5->_cmDataContainer = (CMDataContainer *)v8;

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (void)resetReader
{
}

- (id)grabNextRecvData
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_grabNextDataRecv);
}

- (id)grabNextSentData
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_grabNextDataSent);
}

- (id)grabNextRecvMessage
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_grabNextMessageRecv);
}

- (id)grabNextSentMessage
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_grabNextMessageSent);
}

- (id)grabNextEvent
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_grabNextEvent);
}

- (id)version
{
  return [(CMDataContainer *)self->_cmDataContainer version];
}

- (id)cv3dVersion
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_cv3dVersion);
}

- (id)iOSVersion
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_iOSVersion);
}

- (id)macOSVersion
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_macOSVersion);
}

- (id)cvPlayerVersion
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_cvPlayerVersion);
}

- (id)deviceString
{
  return (id)MEMORY[0x270F9A6D0](self->_cmDataContainer, sel_deviceString);
}

- (id)sessionID
{
  return [(CMDataContainer *)self->_cmDataContainer sessionID];
}

- (id)initWriter
{
  v7.receiver = self;
  v7.super_class = (Class)CMFileInterface;
  v2 = [(CMFileInterface *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CMDataContainer);
    cmDataContainer = v2->_cmDataContainer;
    v2->_cmDataContainer = v3;

    [(CMDataContainer *)v2->_cmDataContainer setIOSVersion:CFCopySystemVersionString()];
    v5 = +[MOVWriterInterface makeDeviceString];
    [(CMDataContainer *)v2->_cmDataContainer setDeviceString:v5];
  }
  return v2;
}

- (void)updateCV3DVersion:(id)a3
{
}

- (void)updateCVPlayerVersion:(id)a3
{
}

- (void)updateSessionID:(id)a3
{
}

- (void)processCMData:(id)a3
{
  cmDataContainer = self->_cmDataContainer;
  id v4 = a3;
  -[CMDataContainer appendCMData:sending:](cmDataContainer, "appendCMData:sending:", v4, [v4 isSent]);
}

- (void)processCMData:(id)a3 sending:(BOOL)a4
{
}

- (BOOL)saveToFileURL:(id)a3
{
  return MEMORY[0x270F9A6D0](CMFileInterface, sel_writeContainerToFileURL_container_);
}

+ (BOOL)writeContainerToFileURL:(id)a3 container:(id)a4
{
  id v5 = a3;
  v6 = +[CVAMetadataWrapper encodeNSCoderObject:a4];
  objc_super v7 = v6;
  if (v6) {
    char v8 = [v6 writeToURL:v5 atomically:1];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

+ (void)updateCV3DVersion:(id)a3 container:(id)a4
{
}

+ (void)updateCVPlayerVersion:(id)a3 container:(id)a4
{
}

+ (void)updateSessionID:(id)a3 container:(id)a4
{
}

- (void).cxx_destruct
{
}

@end