@interface FIProxyNode
- (BOOL)isPopulated;
- (BOOL)isValid;
- (BOOL)markAsUsed:(id *)a3;
- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7;
- (FINode)subjectNode;
- (FIProxyNode)initWithSubject:(id)a3;
- (id)_uiParent;
- (id)copyProgress;
- (id)downloadProgress;
- (id)enumeratorError;
- (id)fiDomain;
- (id)fileParent;
- (id)fileURL;
- (id)fpDomain;
- (id)fpItem;
- (id)iteratorWithOptions:(unsigned int)a3;
- (id)nodesToObserve;
- (id)parent;
- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsBoolean:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6;
- (id)shortDescription;
- (id)source;
- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4;
- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4;
- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4;
- (void)inlineProgressCancel;
- (void)nodeRestartObservingWithOptions:(unsigned int)a3;
- (void)setSubjectNode:(id)a3;
- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4;
- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4;
@end

@implementation FIProxyNode

- (FIProxyNode)initWithSubject:(id)a3
{
  v4 = (FINode *)a3;
  v8.receiver = self;
  v8.super_class = (Class)FIProxyNode;
  v5 = [(FICustomNode *)&v8 init];
  subjectNode = v5->_subjectNode;
  v5->_subjectNode = v4;

  return v5;
}

- (id)fileURL
{
  return [(FINode *)self->_subjectNode fileURL];
}

- (id)fpItem
{
  return [(FINode *)self->_subjectNode fpItem];
}

- (id)fpDomain
{
  return [(FINode *)self->_subjectNode fpDomain];
}

- (id)fiDomain
{
  return [(FINode *)self->_subjectNode fiDomain];
}

- (id)enumeratorError
{
  return [(FINode *)self->_subjectNode enumeratorError];
}

- (void)inlineProgressCancel
{
}

- (id)downloadProgress
{
  return [(FINode *)self->_subjectNode downloadProgress];
}

- (id)copyProgress
{
  return [(FINode *)self->_subjectNode copyProgress];
}

- (BOOL)isPopulated
{
  return [(FINode *)self->_subjectNode isPopulated];
}

- (id)fileParent
{
  return [(FINode *)self->_subjectNode fileParent];
}

- (id)parent
{
  return [(FINode *)self->_subjectNode parent];
}

- (id)_uiParent
{
  return [(FINode *)self->_subjectNode _uiParent];
}

- (id)source
{
  return self->_subjectNode;
}

- (id)nodesToObserve
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_subjectNode;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (BOOL)isValid
{
  return [(FINode *)self->_subjectNode isValid];
}

- (unint64_t)nodeIs:(unint64_t)a3 error:(id *)a4
{
  return [(FINode *)self->_subjectNode nodeIs:a3 error:a4];
}

- (unsigned)volumeIs:(unsigned int)a3 error:(id *)a4
{
  return [(FINode *)self->_subjectNode volumeIs:*(void *)&a3 error:a4];
}

- (unsigned)nodePermissions:(unsigned int)a3 error:(id *)a4
{
  return [(FINode *)self->_subjectNode nodePermissions:*(void *)&a3 error:a4];
}

- (void)synchronizeWithOptions:(unsigned int)a3 async:(BOOL)a4
{
}

- (void)synchronizeChildren:(unsigned int)a3 events:(void *)a4
{
}

- (void)nodeRestartObservingWithOptions:(unsigned int)a3
{
}

- (id)propertyAsNumber:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsNumber:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsDate:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsDate:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsString:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsString:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsArray:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsArray:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsNSObject:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsNSObject:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsDictionary:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsDictionary:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (BOOL)propertyAsBool:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsBool:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsBoolean:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsBoolean:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (id)propertyAsData:(unsigned int)a3 async:(BOOL)a4 options:(unsigned int)a5 error:(id *)a6
{
  return [(FINode *)self->_subjectNode propertyAsData:*(void *)&a3 async:a4 options:*(void *)&a5 error:a6];
}

- (BOOL)setProperty:(unsigned int)a3 asNumber:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asNumber:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)setProperty:(unsigned int)a3 asDate:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asDate:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)setProperty:(unsigned int)a3 asString:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asString:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)setProperty:(unsigned int)a3 asArray:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asArray:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)setProperty:(unsigned int)a3 asDictionary:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asDictionary:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)setProperty:(unsigned int)a3 asBool:(BOOL)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asBool:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)setProperty:(unsigned int)a3 asData:(id)a4 async:(BOOL)a5 options:(unsigned int)a6 error:(id *)a7
{
  return [(FINode *)self->_subjectNode setProperty:*(void *)&a3 asData:a4 async:a5 options:*(void *)&a6 error:a7];
}

- (BOOL)markAsUsed:(id *)a3
{
  return [(FINode *)self->_subjectNode markAsUsed:a3];
}

- (id)iteratorWithOptions:(unsigned int)a3
{
  return [(FINode *)self->_subjectNode iteratorWithOptions:*(void *)&a3];
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"%@(%@)", objc_opt_class(), self->_subjectNode];
}

- (FINode)subjectNode
{
  return self->_subjectNode;
}

- (void)setSubjectNode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end