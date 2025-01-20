@interface SCNProgram
+ (BOOL)supportsSecureCoding;
+ (SCNProgram)program;
+ (SCNProgram)programWithLibrary:(id)a3;
- (BOOL)isOpaque;
- (NSString)fragmentFunctionName;
- (NSString)fragmentShader;
- (NSString)semanticForSymbol:(NSString *)symbol;
- (NSString)vertexFunctionName;
- (NSString)vertexShader;
- (SCNProgram)init;
- (SCNProgram)initWithCoder:(id)a3;
- (id)_allSymbolsWithSceneKitSemantic;
- (id)_bufferBindings;
- (id)_optionsForSymbol:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)delegate;
- (id)library;
- (id)libraryProvider;
- (id)name;
- (id)sourceFile;
- (int)shadingLanguage;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)handleBindingOfBufferNamed:(NSString *)name frequency:(SCNBufferFrequency)frequency usingBlock:(SCNBufferBindingBlock)block;
- (void)setDelegate:(id)delegate;
- (void)setFragmentFunctionName:(NSString *)fragmentFunctionName;
- (void)setFragmentShader:(NSString *)fragmentShader;
- (void)setLibrary:(id)library;
- (void)setLibraryProvider:(id)a3;
- (void)setName:(id)a3;
- (void)setOpaque:(BOOL)opaque;
- (void)setSemantic:(NSString *)semantic forSymbol:(NSString *)symbol options:(NSDictionary *)options;
- (void)setSemantic:(id)a3 forSymbol:(id)a4;
- (void)setSemanticInfos:(id)a3;
- (void)setSourceFile:(id)a3;
- (void)setVertexFunctionName:(NSString *)vertexFunctionName;
- (void)setVertexShader:(NSString *)vertexShader;
@end

@implementation SCNProgram

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNProgram;
  [(SCNProgram *)&v3 dealloc];
}

- (SCNProgram)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCNProgram;
  v2 = [(SCNProgram *)&v4 init];
  if (v2 && (C3DWasLinkedBeforeMajorOSYear2014() & 1) == 0) {
    v2->_opaque = 1;
  }
  return v2;
}

- (void)setLibrary:(id)library
{
  objc_super v3 = self->_library;
  if (v3 != library)
  {

    self->_library = (MTLLibrary *)library;
    self->_libraryProvider = (SCNMetalLibraryProvider *)[[SCNMetalLibraryProvider alloc] iniWithLibrary:library];
    v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (id)library
{
  return self->_library;
}

- (void)setLibraryProvider:(id)a3
{
  if (self->_libraryProvider != a3)
  {

    self->_library = 0;
    self->_libraryProvider = (SCNMetalLibraryProvider *)a3;
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (id)libraryProvider
{
  return self->_libraryProvider;
}

- (void)setName:(id)a3
{
  if (!-[NSString isEqualToString:](self->_name, "isEqualToString:"))
  {

    self->_name = (NSString *)[a3 copy];
  }
}

- (int)shadingLanguage
{
  return !self->_vertexFunctionName && self->_fragmentFunctionName == 0;
}

- (id)name
{
  return self->_name;
}

+ (SCNProgram)program
{
  id v2 = objc_alloc_init((Class)a1);

  return (SCNProgram *)v2;
}

+ (SCNProgram)programWithLibrary:(id)a3
{
  objc_super v4 = (SCNProgram *)objc_alloc_init((Class)a1);
  [(SCNProgram *)v4 setLibrary:a3];
  return v4;
}

- (void)setSourceFile:(id)a3
{
  sourceFile = self->_sourceFile;
  if (sourceFile != a3)
  {

    self->_sourceFile = (NSString *)a3;
  }
}

- (id)sourceFile
{
  return self->_sourceFile;
}

- (BOOL)isOpaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)opaque
{
  if (self->_opaque != opaque)
  {
    self->_opaque = opaque;
    objc_super v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (void)setVertexFunctionName:(NSString *)vertexFunctionName
{
  if (!-[NSString isEqualToString:](self->_vertexFunctionName, "isEqualToString:"))
  {

    self->_vertexFunctionName = (NSString *)[(NSString *)vertexFunctionName copy];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (NSString)vertexFunctionName
{
  return self->_vertexFunctionName;
}

- (void)setFragmentFunctionName:(NSString *)fragmentFunctionName
{
  if (!-[NSString isEqualToString:](self->_fragmentFunctionName, "isEqualToString:"))
  {

    self->_fragmentFunctionName = (NSString *)[(NSString *)fragmentFunctionName copy];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (NSString)fragmentFunctionName
{
  return self->_fragmentFunctionName;
}

- (void)setVertexShader:(NSString *)vertexShader
{
  if (!-[NSString isEqualToString:](self->_vertexShader, "isEqualToString:"))
  {

    self->_vertexShader = (NSString *)[(NSString *)vertexShader copy];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (NSString)vertexShader
{
  return self->_vertexShader;
}

- (void)setFragmentShader:(NSString *)fragmentShader
{
  if (!-[NSString isEqualToString:](self->_fragmentShader, "isEqualToString:"))
  {

    self->_fragmentShader = (NSString *)[(NSString *)fragmentShader copy];
    v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
}

- (NSString)fragmentShader
{
  return self->_fragmentShader;
}

- (void)setSemantic:(NSString *)semantic forSymbol:(NSString *)symbol options:(NSDictionary *)options
{
  v11[1] = *MEMORY[0x263EF8340];
  if (!self->_semanticInfos) {
    self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  [(NSMutableDictionary *)self->_semanticInfos setValue:+[SCNProgramSemanticInfo infoWithSemantic:semantic options:options] forKey:symbol];
  v9 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  v10 = @"parameter";
  v11[0] = symbol;
  objc_msgSend(v9, "postNotificationName:object:userInfo:", @"SCNProgramDidChangeNotification", self, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
}

- (NSString)semanticForSymbol:(NSString *)symbol
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_semanticInfos valueForKey:symbol];

  return (NSString *)[v3 semantic];
}

- (id)_optionsForSymbol:(id)a3
{
  objc_super v3 = (void *)[(NSMutableDictionary *)self->_semanticInfos valueForKey:a3];

  return (id)[v3 options];
}

- (id)_allSymbolsWithSceneKitSemantic
{
  id result = self->_semanticInfos;
  if (result) {
    return (id)[result allKeys];
  }
  return result;
}

- (void)setSemanticInfos:(id)a3
{
  semanticInfos = self->_semanticInfos;
  if (semanticInfos)
  {
    [(NSMutableDictionary *)semanticInfos removeAllObjects];
    if (!a3) {
      return;
    }
  }
  else
  {
    self->_semanticInfos = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (!a3) {
      return;
    }
  }
  v6 = self->_semanticInfos;

  [(NSMutableDictionary *)v6 addEntriesFromDictionary:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setVertexShader:", -[SCNProgram vertexShader](self, "vertexShader"));
  objc_msgSend(v4, "setVertexFunctionName:", -[SCNProgram vertexFunctionName](self, "vertexFunctionName"));
  objc_msgSend(v4, "setFragmentFunctionName:", -[SCNProgram fragmentFunctionName](self, "fragmentFunctionName"));
  objc_msgSend(v4, "setFragmentShader:", -[SCNProgram fragmentShader](self, "fragmentShader"));
  objc_msgSend(v4, "setName:", -[SCNProgram name](self, "name"));
  objc_msgSend(v4, "setLibrary:", -[SCNProgram library](self, "library"));
  objc_msgSend(v4, "setLibraryProvider:", -[SCNProgram libraryProvider](self, "libraryProvider"));
  [v4 setSemanticInfos:self->_semanticInfos];
  return v4;
}

- (id)_bufferBindings
{
  return self->_bufferBindings;
}

- (void)handleBindingOfBufferNamed:(NSString *)name frequency:(SCNBufferFrequency)frequency usingBlock:(SCNBufferBindingBlock)block
{
  bufferBindings = self->_bufferBindings;
  if (block)
  {
    if (!bufferBindings) {
      self->_bufferBindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    v10 = objc_alloc_init(SCNBufferBinding);
    [(SCNBufferBinding *)v10 setName:name];
    [(SCNBufferBinding *)v10 setFrequency:frequency];
    [(SCNBufferBinding *)v10 setBlock:_Block_copy(block)];
    [(NSMutableDictionary *)self->_bufferBindings setValue:v10 forKey:name];

    v11 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v11 postNotificationName:@"SCNProgramDidChangeNotification" object:self userInfo:0];
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](bufferBindings, "removeObjectForKey:", name, frequency);
    v12 = objc_alloc_init(SCNBufferBinding);
    [(SCNBufferBinding *)v12 setName:name];
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:userInfo:", @"SCNProgramDidChangeNotification", self, 0);
  }
}

- (id)copy
{
  return [(SCNProgram *)self copyWithZone:0];
}

- (void)setSemantic:(id)a3 forSymbol:(id)a4
{
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = delegate;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)encodeWithCoder:(id)a3
{
  -[SCNProgram _customEncodingOfSCNProgram:](self, "_customEncodingOfSCNProgram:");
  vertexShader = self->_vertexShader;
  if (vertexShader) {
    [a3 encodeObject:vertexShader forKey:@"vertexShader"];
  }
  fragmentShader = self->_fragmentShader;
  if (fragmentShader) {
    [a3 encodeObject:fragmentShader forKey:@"fragmentShader"];
  }
  vertexFunctionName = self->_vertexFunctionName;
  if (vertexFunctionName) {
    [a3 encodeObject:vertexFunctionName forKey:@"vertexFunctionName"];
  }
  sourceFile = self->_sourceFile;
  if (sourceFile) {
    [a3 encodeObject:sourceFile forKey:@"sourceFile"];
  }
  fragmentFunctionName = self->_fragmentFunctionName;
  if (fragmentFunctionName) {
    [a3 encodeObject:fragmentFunctionName forKey:@"fragmentFunctionName"];
  }
  name = self->_name;
  if (name) {
    [a3 encodeObject:name forKey:@"name"];
  }
  semanticInfos = self->_semanticInfos;
  if (semanticInfos) {
    [a3 encodeObject:semanticInfos forKey:@"semanticInfos"];
  }
  BOOL opaque = self->_opaque;

  [a3 encodeBool:opaque forKey:@"opaque"];
}

- (SCNProgram)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCNProgram;
  id v4 = [(SCNProgram *)&v8 init];
  if (v4)
  {
    BOOL v5 = +[SCNTransaction immediateMode];
    +[SCNTransaction setImmediateMode:1];
    [(SCNProgram *)v4 _customDecodingOfSCNProgram:a3];
    -[SCNProgram setVertexShader:](v4, "setVertexShader:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"vertexShader"]);
    -[SCNProgram setFragmentShader:](v4, "setFragmentShader:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"fragmentShader"]);
    -[SCNProgram setVertexFunctionName:](v4, "setVertexFunctionName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"vertexFunctionName"]);
    -[SCNProgram setFragmentFunctionName:](v4, "setFragmentFunctionName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"fragmentFunctionName"]);
    -[SCNProgram setSourceFile:](v4, "setSourceFile:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceFile"]);
    -[SCNProgram setName:](v4, "setName:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"]);
    v6 = (void *)SCNPlistClasses();
    -[SCNProgram setSemanticInfos:](v4, "setSemanticInfos:", objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setByAddingObject:", objc_opt_class()), @"semanticInfos"));
    -[SCNProgram setOpaque:](v4, "setOpaque:", [a3 decodeBoolForKey:@"opaque"]);
    +[SCNTransaction setImmediateMode:v5];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end