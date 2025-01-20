@interface DOTRenderer
- (BOOL)drawEdgesFirst;
- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4;
- (CGSize)separation;
- (DOTRenderer)init;
- (int)direction;
- (void)dealloc;
- (void)drawEdge:(id)a3 withPath:(id)a4;
- (void)drawNode:(id)a3;
- (void)flushRender;
- (void)setDirection:(int)a3;
- (void)setDrawEdgesFirst:(BOOL)a3;
- (void)setFileTitle:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setSeparation:(CGSize)a3;
@end

@implementation DOTRenderer

- (DOTRenderer)init
{
  v3.receiver = self;
  v3.super_class = (Class)DOTRenderer;
  result = [(DOTRenderer *)&v3 init];
  if (result)
  {
    result->direction = 1;
    result->drawEdgesFirst = 0;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)DOTRenderer;
  [(DOTRenderer *)&v2 dealloc];
}

- (void)setFileURL:(id)a3
{
  self->fileURL = (NSURL *)[a3 URLByAppendingPathExtension:@"dot"];
}

- (void)setFileTitle:(id)a3
{
  self->fileTitle = (NSString *)[a3 copy];
}

- (BOOL)setCanvasWidth:(unsigned int)a3 height:(unsigned int)a4
{
  file = self->file;
  if (file) {
    fclose(file);
  }
  self->file = fopen([(NSString *)[(NSURL *)self->fileURL path] UTF8String], "w");
  fprintf(self->file, "digraph %s {\n", -[NSString UTF8String](-[NSArray componentsJoinedByString:](-[NSString componentsSeparatedByCharactersInSet:](self->fileTitle, "componentsSeparatedByCharactersInSet:", [MEMORY[0x1E4F28B88] whitespaceCharacterSet]), "componentsJoinedByString:", @"_"), "UTF8String"));
  fwrite("rankdir=BT;\n", 0xCuLL, 1uLL, self->file);
  return 1;
}

- (void)drawNode:(id)a3
{
  fprintf(self->file, "n%p [", a3);
  unsigned int v5 = [a3 color];
  if (v5 >= 0x10) {
    -[DOTRenderer drawNode:]();
  }
  v6 = off_1E5771D28[v5];
  unsigned int v7 = [a3 shape];
  if (v7 >= 4) {
    -[DOTRenderer drawNode:]();
  }
  fprintf(self->file, "style=filled, shape=%s, color=black, fillcolor=\"%s\"", off_1E5771DA8[v7], v6);
  fwrite("label=<<table border=\"0\" cellborder=\"0\" cellspacing=\"0\">", 0x38uLL, 1uLL, self->file);
  if ([a3 title]) {
    fprintf(self->file, "<tr><td valign='middle'><font face='Menlo'>[%s]</font></td></tr>", (const char *)objc_msgSend((id)objc_msgSend(a3, "title"), "UTF8String"));
  }
  fprintf(self->file, "<tr><td valign='middle' balign='left'><font face='Menlo'>%s</font></td></tr>", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "label"), "stringByReplacingOccurrencesOfString:withString:", @"\n", @"<br/>"), "UTF8String"));
  fwrite("</table>>", 9uLL, 1uLL, self->file);
  file = self->file;

  fwrite("];\n", 3uLL, 1uLL, file);
}

- (void)drawEdge:(id)a3 withPath:(id)a4
{
}

- (void)flushRender
{
  self->file = 0;
}

- (int)direction
{
  return self->direction;
}

- (void)setDirection:(int)a3
{
  self->direction = a3;
}

- (CGSize)separation
{
  objc_copyStruct(v4, &self->separation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSeparation:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->separation, &v3, 16, 1, 0);
}

- (BOOL)drawEdgesFirst
{
  return self->drawEdgesFirst;
}

- (void)setDrawEdgesFirst:(BOOL)a3
{
  self->drawEdgesFirst = a3;
}

- (void)drawNode:.cold.1()
{
}

- (void)drawNode:.cold.2()
{
}

@end