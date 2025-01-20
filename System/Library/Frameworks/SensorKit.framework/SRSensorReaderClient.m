@interface SRSensorReaderClient
- (void)resetDatastoreFiles:(id)a3;
@end

@implementation SRSensorReaderClient

- (void)resetDatastoreFiles:(id)a3
{
  if (self) {
    self = (SRSensorReaderClient *)objc_loadWeak((id *)&self->_reader);
  }

  [(SRSensorReaderClient *)self resetDatastoreFiles:a3];
}

- (void).cxx_destruct
{
}

@end