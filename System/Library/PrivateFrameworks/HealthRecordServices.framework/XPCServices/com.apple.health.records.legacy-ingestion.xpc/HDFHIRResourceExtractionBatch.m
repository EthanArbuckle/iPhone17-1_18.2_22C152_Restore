@interface HDFHIRResourceExtractionBatch
- (HDFHIRResourceDocument)document;
- (HDFHIRResourceExtractionBatch)init;
- (HDFHIRResourceExtractionBatch)initWithDocument:(id)a3 rulesVersion:(id)a4;
- (HDFHIRResourceExtractionBatch)initWithDocument:(id)a3 rulesVersion:(id)a4 highestRowID:(id)a5;
- (NSNumber)highestRowID;
- (NSNumber)rulesVersion;
@end

@implementation HDFHIRResourceExtractionBatch

- (HDFHIRResourceExtractionBatch)init
{
  v3 = NSStringFromSelector(a2);
  +[NSException raise:NSInvalidArgumentException, @"The -%@ method is not available on %@", v3, objc_opt_class() format];

  return 0;
}

- (HDFHIRResourceExtractionBatch)initWithDocument:(id)a3 rulesVersion:(id)a4
{
  return [(HDFHIRResourceExtractionBatch *)self initWithDocument:a3 rulesVersion:a4 highestRowID:&off_100015A60];
}

- (HDFHIRResourceExtractionBatch)initWithDocument:(id)a3 rulesVersion:(id)a4 highestRowID:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDFHIRResourceExtractionBatch.m", 32, @"Invalid parameter not satisfying: %@", @"document" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v21 = +[NSAssertionHandler currentHandler];
  [v21 handleFailureInMethod:a2, self, @"HDFHIRResourceExtractionBatch.m", 33, @"Invalid parameter not satisfying: %@", @"rulesVersion != nil" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)HDFHIRResourceExtractionBatch;
  v13 = [(HDFHIRResourceExtractionBatch *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_document, a3);
    v15 = (NSNumber *)[v11 copy];
    rulesVersion = v14->_rulesVersion;
    v14->_rulesVersion = v15;

    v17 = (NSNumber *)[v12 copy];
    highestRowID = v14->_highestRowID;
    v14->_highestRowID = v17;
  }
  return v14;
}

- (HDFHIRResourceDocument)document
{
  return self->_document;
}

- (NSNumber)rulesVersion
{
  return self->_rulesVersion;
}

- (NSNumber)highestRowID
{
  return self->_highestRowID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highestRowID, 0);
  objc_storeStrong((id *)&self->_rulesVersion, 0);

  objc_storeStrong((id *)&self->_document, 0);
}

@end