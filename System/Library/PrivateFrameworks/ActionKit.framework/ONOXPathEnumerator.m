@interface ONOXPathEnumerator
- (ONOXMLDocument)document;
- (_xmlXPathObject)xmlXPath;
- (id)allObjects;
- (id)nextObject;
- (id)objectAtIndex:(int64_t)a3;
- (unint64_t)cursor;
- (void)dealloc;
- (void)setCursor:(unint64_t)a3;
- (void)setDocument:(id)a3;
- (void)setXmlXPath:(_xmlXPathObject *)a3;
@end

@implementation ONOXPathEnumerator

- (void).cxx_destruct
{
}

- (void)setDocument:(id)a3
{
}

- (ONOXMLDocument)document
{
  return self->_document;
}

- (void)setCursor:(unint64_t)a3
{
  self->_cursor = a3;
}

- (unint64_t)cursor
{
  return self->_cursor;
}

- (void)setXmlXPath:(_xmlXPathObject *)a3
{
  self->_xmlXPath = a3;
}

- (_xmlXPathObject)xmlXPath
{
  return self->_xmlXPath;
}

- (id)nextObject
{
  unint64_t v3 = [(ONOXPathEnumerator *)self cursor];
  if (v3 >= *(int *)[(ONOXPathEnumerator *)self xmlXPath][8])
  {
    v5 = 0;
  }
  else
  {
    unint64_t v4 = [(ONOXPathEnumerator *)self cursor];
    [(ONOXPathEnumerator *)self setCursor:v4 + 1];
    v5 = [(ONOXPathEnumerator *)self objectAtIndex:v4];
  }
  return v5;
}

- (id)allObjects
{
  unint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", *(int *)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8]);
  for (uint64_t i = 0; ; ++i)
  {
    uint64_t v5 = (uint64_t)[(ONOXPathEnumerator *)self xmlXPath][8];
    if (v5) {
      LODWORD(v5) = *(_DWORD *)[(ONOXPathEnumerator *)self xmlXPath][8];
    }
    if (i >= (int)v5) {
      break;
    }
    v6 = [(ONOXPathEnumerator *)self objectAtIndex:i];
    if (v6) {
      [v3 addObject:v6];
    }
  }
  v7 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v7;
}

- (id)objectAtIndex:(int64_t)a3
{
  int64_t v5 = (uint64_t)[(ONOXPathEnumerator *)self xmlXPath][8];
  if (v5) {
    int64_t v5 = *(int *)[(ONOXPathEnumerator *)self xmlXPath][8];
  }
  if (v5 <= a3)
  {
    v7 = 0;
  }
  else
  {
    v6 = [(ONOXPathEnumerator *)self document];
    v7 = objc_msgSend(v6, "elementWithNode:", *(void *)(*(void *)((void)-[ONOXPathEnumerator xmlXPath](self, "xmlXPath")[8] + 8) + 8 * a3));
  }
  return v7;
}

- (void)dealloc
{
  xmlXPath = self->_xmlXPath;
  if (xmlXPath) {
    xmlXPathFreeObject(xmlXPath);
  }
  v4.receiver = self;
  v4.super_class = (Class)ONOXPathEnumerator;
  [(ONOXPathEnumerator *)&v4 dealloc];
}

@end