@interface BMStreamInternalMetadata
- (BMStreamInternalMetadata)initWithSummary:(id)a3 description:(id)a4 eventName:(id)a5 radarComponent:(id)a6 publiclyIndexable:(BOOL)a7;
- (BOOL)publiclyIndexable;
- (NSString)eventName;
- (NSString)fullDescription;
- (NSString)radarComponent;
- (NSString)summary;
@end

@implementation BMStreamInternalMetadata

- (BMStreamInternalMetadata)initWithSummary:(id)a3 description:(id)a4 eventName:(id)a5 radarComponent:(id)a6 publiclyIndexable:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)BMStreamInternalMetadata;
  v17 = [(BMStreamInternalMetadata *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_summary, a3);
    objc_storeStrong((id *)&v18->_eventName, a5);
    objc_storeStrong((id *)&v18->_radarComponent, a6);
    objc_storeStrong((id *)&v18->_fullDescription, a4);
    v18->_publiclyIndexable = a7;
  }

  return v18;
}

- (NSString)summary
{
  return self->_summary;
}

- (NSString)fullDescription
{
  return self->_fullDescription;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)radarComponent
{
  return self->_radarComponent;
}

- (BOOL)publiclyIndexable
{
  return self->_publiclyIndexable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarComponent, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
  objc_storeStrong((id *)&self->_fullDescription, 0);

  objc_storeStrong((id *)&self->_summary, 0);
}

@end