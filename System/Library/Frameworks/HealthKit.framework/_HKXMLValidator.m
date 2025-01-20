@interface _HKXMLValidator
+ (id)validatorWithPathToXSD:(id)a3;
+ (id)validatorWithXSD:(id)a3;
- (BOOL)validateXML:(id)a3 simpleError:(id *)a4 detailedErrors:(id *)a5;
- (id)_initWithSchema:(_xmlSchema *)a3;
- (void)dealloc;
@end

@implementation _HKXMLValidator

+ (id)validatorWithXSD:(id)a3
{
  id v4 = a3;
  v5 = (const char *)[v4 bytes];
  int v6 = [v4 length];

  v7 = xmlSchemaNewMemParserCtxt(v5, v6);
  if (v7)
  {
    v8 = v7;
    xmlSchemaPtr v9 = xmlSchemaParse(v7);
    xmlSchemaFreeParserCtxt(v8);
    if (v9) {
      v7 = (xmlSchemaParserCtxt *)[objc_alloc((Class)a1) _initWithSchema:v9];
    }
    else {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)validatorWithPathToXSD:(id)a3
{
  id v4 = xmlSchemaNewParserCtxt((const char *)[a3 cStringUsingEncoding:4]);
  if (v4)
  {
    v5 = v4;
    xmlSchemaPtr v6 = xmlSchemaParse(v4);
    xmlSchemaFreeParserCtxt(v5);
    if (v6) {
      id v4 = (xmlSchemaParserCtxt *)[objc_alloc((Class)a1) _initWithSchema:v6];
    }
    else {
      id v4 = 0;
    }
  }

  return v4;
}

- (id)_initWithSchema:(_xmlSchema *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_HKXMLValidator;
  id result = [(_HKXMLValidator *)&v5 init];
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (void)dealloc
{
  xsdSchema = self->_xsdSchema;
  if (xsdSchema)
  {
    xmlSchemaFree(xsdSchema);
    self->_xsdSchema = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_HKXMLValidator;
  [(_HKXMLValidator *)&v4 dealloc];
}

- (BOOL)validateXML:(id)a3 simpleError:(id *)a4 detailedErrors:(id *)a5
{
  id v8 = a3;
  xmlSchemaPtr v9 = objc_alloc_init(_HKValidationErrorTracker);
  id v10 = v8;
  v11 = (const char *)[v10 bytes];
  int v12 = [v10 length];

  xmlSetGenericErrorFunc(v9, (xmlGenericErrorFunc)_ValidatorErrorFunc);
  Memory = xmlReadMemory(v11, v12, "content.xml", 0, 0);
  xmlSetGenericErrorFunc(0, 0);
  if (!Memory)
  {
    v17 = @"Failed to validate XML: unable to read XML content";
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v14 = xmlSchemaNewValidCtxt(self->_xsdSchema);
  if (!v14)
  {
    v17 = @"Failed to validate XML: internal error creating validation context";
    if (!a4) {
      goto LABEL_8;
    }
LABEL_7:
    *a4 = v17;
    goto LABEL_8;
  }
  v15 = v14;
  xmlSchemaSetValidErrors(v14, (xmlSchemaValidityErrorFunc)_ValidatorErrorFunc, (xmlSchemaValidityWarningFunc)_ValidatorWarnFunc, v9);
  uint64_t v16 = xmlSchemaValidateDoc(v15, Memory);
  if (!v16)
  {
    xmlSchemaFreeValidCtxt(v15);
    v17 = 0;
    BOOL v18 = 1;
    goto LABEL_14;
  }
  v17 = [NSString stringWithFormat:@"Failed to validate XML, error code %d", v16];
  xmlSchemaFreeValidCtxt(v15);
  if (a4) {
    goto LABEL_7;
  }
LABEL_8:
  if (a5)
  {
    [(_HKValidationErrorTracker *)v9 errorMessage];
    BOOL v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_14:

  return v18;
}

@end