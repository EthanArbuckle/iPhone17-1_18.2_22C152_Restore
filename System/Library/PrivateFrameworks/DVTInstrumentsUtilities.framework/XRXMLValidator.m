@interface XRXMLValidator
- (BOOL)validate;
- (NSFileHandle)diagnosticFile;
- (NSFileHandle)errorFile;
- (OS_os_log)log;
- (XRXMLValidator)initWithSourceURL:(id)a3 schemaURL:(id)a4;
- (id)findErrorMessageForErrorPtr:(_xmlError *)a3;
- (unint64_t)errorLimit;
- (void)setDiagnosticFile:(id)a3;
- (void)setErrorFile:(id)a3;
- (void)setErrorLimit:(unint64_t)a3;
- (void)setLog:(id)a3;
@end

@implementation XRXMLValidator

- (XRXMLValidator)initWithSourceURL:(id)a3 schemaURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)XRXMLValidator;
  v12 = [(XRXMLValidator *)&v34 init];
  if (v12)
  {
    uint64_t v13 = [v6 copyWithZone:v8];
    url = v12->_url;
    v12->_url = (NSURL *)v13;

    uint64_t v19 = [v7 copyWithZone:v15 usingConcreteClass:v16 forClass:v17 withDescription:v18];
    schemaURL = v12->_schemaURL;
    v12->_schemaURL = (NSURL *)v19;

    uint64_t v25 = [MEMORY[0x263F08840] fileHandleWithStandardError:v21, v22, v23, v24];
    errorFile = v12->_errorFile;
    v12->_errorFile = (NSFileHandle *)v25;

    uint64_t v31 = [MEMORY[0x263F08840] fileHandleWithStandardOutput:v27, v28, v29, v30];
    diagnosticFile = v12->_diagnosticFile;
    v12->_diagnosticFile = (NSFileHandle *)v31;

    objc_storeStrong((id *)&v12->_log, MEMORY[0x263EF8440]);
  }

  return v12;
}

- (id)findErrorMessageForErrorPtr:(_xmlError *)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v4 = self->_errorReplacements;
  uint64_t v6 = [v4 countByEnumeratingWithState:v5 objects:&v48 count:16];
  if (v6)
  {
    uint64_t v11 = v6;
    uint64_t v12 = *(void *)v49;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v49 != v12) {
        objc_enumerationMutation(v4);
      }
      v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
      int code = a3->code;
      if (code == 1839) {
        break;
      }
      if (code == 1877)
      {
        uint64_t v16 = [*(void **)(*((void *)&v48 + 1) + 8 * v13) v7:v8:v9:v10];
        char isEqualToString = [v16 isEqualToString:v17];

        p_str2 = &a3->str2;
        if ((isEqualToString & 1) != 0
          || (v14 v7 v21 v9 v10),
              uint64_t v23 = objc_claimAutoreleasedReturnValue(),
              int v27 = [v23 isEqualToString:v24],
              v23,
              p_str2 = &a3->str3,
              v27))
        {
          uint64_t v8 = (uint64_t)*p_str2;
          if (*p_str2)
          {
            uint64_t v28 = [NSString stringWithUTF8String:v7];
            v33 = [v14 valueForKey:v29 withArguments:v30, v31, v32];
            char v37 = [v28 containsString:v34 options:(uint64_t)v33 range:v35];
LABEL_13:
            char v45 = v37;

            if (v45)
            {
              id v46 = v14;

              goto LABEL_19;
            }
          }
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v4 countByEnumeratingWithState:v7 objects:&v48 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    uint64_t v28 = [NSString stringWithUTF8String:v7];
    v33 = [v14 valueForKeyPath:v38 withArguments:v39, v40, v41];
    char v37 = [v28 isEqualToString:v42];
    goto LABEL_13;
  }
LABEL_17:
  id v46 = 0;
LABEL_19:

  return v46;
}

- (BOOL)validate
{
  self->_errorsEmittedCount = 0;
  self->_limitMessageEmitted = 0;
  v3 = objc_opt_new();
  [v3 setErrorFile:self->_errorFile];
  [v3 setLog:self->_log];
  [v3 setUrlBeingParsed:v10 url:self->_schemaURL transitionContext:v11 completion:v12];
  uint64_t v13 = [XRSchemaElementsRecursiveParser alloc];
  uint64_t v16 = [v13 initWithElementName:v14 context:@"xs:schema" options:v3];
  v20 = [MEMORY[0x263EFF950] inputStreamWithURL:v17 schemaURL:self->_schemaURL options:v18 error:v19];
  [XRXMLParser parseStream:v21 topLevelParser:v20 delegate:v16];
  if ([v3 _callOutQueue_willDestroyWithTransitionContext:v22 completion:v23])
  {
    [v16 setErrorMessagesReplacements:v26, v27, v28, v29];
    uint64_t v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
    errorReplacements = self->_errorReplacements;
    self->_errorReplacements = v30;

    xmlLockLibrary();
    uint64_t v36 = (const char *)[self->_schemaURL fileSystemRepresentationWithPath:v32 isDirectory:v33 create:v34 error:v35];
    char v37 = xmlSchemaNewParserCtxt(v36);
    v38 = xmlSchemaParse(v37);
    uint64_t v39 = xmlSchemaNewValidCtxt(v38);
    xmlSchemaSetValidStructuredErrors(v39, (xmlStructuredErrorFunc)sub_23458D928, self);
    uint64_t v44 = (const char *)[self->_url fileSystemRepresentation:v40 length:v41];
    xmlSchemaValidateSetFilename(v39, v44);
    char v45 = *__xmlStructuredError();
    id v46 = *__xmlStructuredErrorContext();
    xmlSetStructuredErrorFunc(self, (xmlStructuredErrorFunc)sub_23458DC54);
    xmlParserCtxtPtr v47 = xmlNewParserCtxt();
    if (v47)
    {
      v52 = v47;
      v62 = v45;
      uint64_t v53 = (const char *)[self->_url fileSystemRepresentation];
      File = xmlCtxtReadFile(v52, v53, 0, 0);
      xmlFreeParserCtxt(v52);
      if (File)
      {
        xmlFreeDoc(File);
        v59 = (const char *)[self->_url fileSystemRepresentation];
        BOOL v60 = xmlSchemaValidateFile(v39, v59, 0) == 0;
      }
      else
      {
        BOOL v60 = 0;
      }
      char v45 = v62;
    }
    else
    {
      [self->_errorFile writeStringWithFormat:@"Failed to create the XML parsing context"];
      BOOL v60 = 0;
    }
    xmlSetStructuredErrorFunc(v46, v45);
    xmlSchemaFreeValidCtxt(v39);
    xmlSchemaFree(v38);
    xmlSchemaFreeParserCtxt(v37);
    xmlUnlockLibrary();
  }
  else
  {
    [self->_errorFile writeStringWithFormat:@"Failed to parse the XSD schema for validation"];
    BOOL v60 = 0;
  }

  return v60;
}

- (NSFileHandle)errorFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 48, 1);
}

- (void)setErrorFile:(id)a3
{
}

- (NSFileHandle)diagnosticFile
{
  return (NSFileHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDiagnosticFile:(id)a3
{
}

- (unint64_t)errorLimit
{
  return self->_errorLimit;
}

- (void)setErrorLimit:(unint64_t)a3
{
  self->_errorLimit = a3;
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_diagnosticFile, 0);
  objc_storeStrong((id *)&self->_errorFile, 0);
  objc_storeStrong((id *)&self->_errorReplacements, 0);
  objc_storeStrong((id *)&self->_schemaURL, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end