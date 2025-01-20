@interface CoreDAVXMLData_Impl
- (_xmlDoc)doc;
- (_xmlTextWriter)writer;
- (void)setDoc:(_xmlDoc *)a3;
- (void)setWriter:(_xmlTextWriter *)a3;
@end

@implementation CoreDAVXMLData_Impl

- (_xmlDoc)doc
{
  return self->_doc;
}

- (void)setDoc:(_xmlDoc *)a3
{
  self->_doc = a3;
}

- (_xmlTextWriter)writer
{
  return self->_writer;
}

- (void)setWriter:(_xmlTextWriter *)a3
{
  self->_writer = a3;
}

@end