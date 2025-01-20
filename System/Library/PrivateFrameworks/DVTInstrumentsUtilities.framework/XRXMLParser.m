@interface XRXMLParser
+ (BOOL)parseStream:(id)a3 topLevelParser:(id)a4 delegate:(id)a5;
+ (id)commonXMLSchemaRepositoryURL;
- (BOOL)parseData:(id)a3;
- (XRIssueResponder)issueResponder;
- (XRXMLParser)init;
- (XRXMLParser)initWithTopLevelParser:(id)a3;
- (XRXMLParserDelegate)delegate;
- (void)finishedParsing;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setIssueResponder:(id)a3;
@end

@implementation XRXMLParser

+ (id)commonXMLSchemaRepositoryURL
{
  v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.dt.instruments.DVTInstrumentsUtilities" inDirectory:a2 forLocalization:v2 preferredLocalizations:v3];
  uint64_t v9 = [v4 resourceURLWithName:v5 bundle:v6 localization:v7];
  if (!v9) {
    sub_23459B880();
  }
  v10 = (void *)v9;

  return v10;
}

+ (BOOL)parseStream:(id)a3 topLevelParser:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [XRXMLParser alloc];
  v14 = [v10 initWithTopLevelParser:v11 topLevelParserOptions:v8 topLevelParserFlags:v12 topLevelParserState:v13];
  [v14 setDelegate:v15];
  if (![v7 _streamStatus:v18 buffer:v19 bufferSize:v20 error:v21]) {
    [v7 open:v22, v23, v24, v25];
  }
  v30 = [MEMORY[0x263EFF990] dataWithLength:v22 bytes:*MEMORY[0x263EF8AF8] length:v24];
  char v31 = 1;
  while (1)
  {
    if ([v7 _streamStatus:v26:v27:v28:v29] != 2)
    {
LABEL_10:
      BOOL v46 = 1;
      goto LABEL_12;
    }
    id v32 = v30;
    uint64_t v37 = [v32 mutableBytesWithBytesNoCopy:v33 length:v34 freeWhenDone:v35];
    uint64_t v42 = [v32 v38:v39 v40:v41];
    uint64_t maxLength = [v7 _read_maxLength:v43 with:v37 with:v42 with:v44];
    if (maxLength < 1) {
      break;
    }
    char v31 = [v14 parseData:v26 data:v32 length:v28];
LABEL_9:
    if ([v7 hasBytesAvailable:v26 length:v27 buffer:v28 bufferOffset:v29] == NO) {
      goto LABEL_10;
    }
  }
  if ((maxLength & 0x8000000000000000) == 0) {
    goto LABEL_9;
  }
  BOOL v46 = 0;
LABEL_12:
  [v14 finishedParsing:v26 withError:v27 withContext:v28 withCompletion:v29];

  return v46;
}

- (XRXMLParser)init
{
  return 0;
}

- (XRXMLParser)initWithTopLevelParser:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XRXMLParser;
  uint64_t v6 = [(XRXMLParser *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_topLevelElementParser, a3);
    }
    else
    {

      id v7 = 0;
    }
  }

  return v7;
}

- (BOOL)parseData:(id)a3
{
  id v7 = a3;
  parser = self->_parser;
  if (!parser)
  {
    id v9 = objc_alloc(MEMORY[0x263F08D58]);
    v14 = [v9 initForIncrementalParsingWithData:v10 options:v11 error:v12];
    v15 = self->_parser;
    self->_parser = v14;

    [self->_parser setDelegate:v16 queue:v17 retain:v18];
    parser = self->_parser;
  }
  char v19 = [parser parseData:v4 data:v7 length:v5 error:v6];

  return v19;
}

- (void)finishedParsing
{
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateWantsFinishedCB = p_delegate & 1;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v34 = a3;
  id v10 = a4;
  id v15 = a7;
  workingElement = self->_workingElement;
  if (workingElement)
  {
    uint64_t v17 = [v34 v11:v12:v13:v14];
    uint64_t v22 = [v34 _columnNumber:v18 lineNumber:v19 columnNumber:v20];
    uint64_t v28 = [workingElement startElementWithName:v23 attributes:v10 line:v15 col:v22];
    if (v28) {
      objc_storeStrong((id *)&self->_workingElement, v28);
    }
    else {
      [self->_parser abortParsing:v24 withError:v25 withDescription:v26 withReason:v27];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_workingElement, self->_topLevelElementParser);
    topLevelElementParser = self->_topLevelElementParser;
    self->_topLevelElementParser = 0;

    [self->_workingElement handleStart:v30 v31:v31 v32:v32 v33:v33];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  workingElement = self->_workingElement;
  id v8 = a3;
  uint64_t v13 = [v8 v9:v10 v11:v12];
  uint64_t v18 = [v8 _columnNumber:v14 lineNumber:v15 columnNumber:v16];

  [workingElement endElementAtLine:v13 col:v18];
  uint64_t v21 = (XRXMLElementParser *)objc_claimAutoreleasedReturnValue();
  uint64_t v26 = self->_workingElement;
  v30 = v21;
  if (v21)
  {
    if (v21 != v26 && self->_delegateWantsFinishedCB)
    {
      uint64_t v27 = [self v22:v23 v24:v24 v25:v25];
      [v27 parser_didFinishParsingElement:v28 withElement:self->_workingElement withContext:self];

      uint64_t v21 = v30;
    }
    uint64_t v21 = v21;
    uint64_t v26 = self->_workingElement;
  }
  self->_workingElement = v21;
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
}

- (XRXMLParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (XRXMLParserDelegate *)WeakRetained;
}

- (XRIssueResponder)issueResponder
{
  return self->_issueResponder;
}

- (void)setIssueResponder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueResponder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topLevelElementParser, 0);
  objc_storeStrong((id *)&self->_workingElement, 0);

  objc_storeStrong((id *)&self->_parser, 0);
}

@end