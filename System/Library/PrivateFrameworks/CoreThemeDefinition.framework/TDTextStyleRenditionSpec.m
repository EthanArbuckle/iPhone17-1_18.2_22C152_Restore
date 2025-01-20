@interface TDTextStyleRenditionSpec
- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5;
@end

@implementation TDTextStyleRenditionSpec

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend((id)-[TDTextStyleRenditionSpec production](self, "production", a3, a4, a5), "name"), "name");
  id v7 = objc_alloc(MEMORY[0x263F38370]);
  uint64_t v8 = [(TDTextStyleRenditionSpec *)self fontName];
  [(TDTextStyleRenditionSpec *)self fontSize];
  double v10 = v9;
  [(TDTextStyleRenditionSpec *)self maxPointSize];
  double v12 = v11;
  [(TDTextStyleRenditionSpec *)self minPointSize];
  v14 = objc_msgSend(v7, "initWithTextStyleNamed:fontName:fontSize:maxPointSize:minPointSize:scalingStyle:alignment:", v6, v8, -[TDTextStyleRenditionSpec scalingStyle](self, "scalingStyle"), -[TDTextStyleRenditionSpec alignment](self, "alignment"), v10, v12, v13);
  objc_msgSend(v14, "setRenditionProperties:", -[TDRenditionSpec propertiesAsDictionary](self, "propertiesAsDictionary"));
  objc_msgSend(v14, "setPreserveForArchiveOnly:", -[TDTextStyleRenditionSpec preserveForArchiveOnly](self, "preserveForArchiveOnly"));
  v15 = (void *)[v14 CSIRepresentationWithCompression:0];

  return v15;
}

@end