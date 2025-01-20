@interface CRTTMergeableStringRange
- (BOOL)isEqual:(id)a3;
- (CRTTMergeableStringRange)initWithTopoIDRange:(TopoIDRange *)a3 renameGeneration:(int64_t)a4 maxCounter:(int64_t)a5;
- (TopoIDRange)range;
- (id).cxx_construct;
- (id)_objCRenameSequence;
- (id)description;
- (id)subrangeFrom:(_NSRange)a3;
- (int64_t)maxCounter;
- (int64_t)renameGeneration;
- (void)dealloc;
- (void)setMaxCounter:(int64_t)a3;
- (void)setRenameGeneration:(int64_t)a3;
@end

@implementation CRTTMergeableStringRange

- (CRTTMergeableStringRange)initWithTopoIDRange:(TopoIDRange *)a3 renameGeneration:(int64_t)a4 maxCounter:(int64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CRTTMergeableStringRange;
  v8 = [(CRTTMergeableStringRange *)&v12 init];
  long long v9 = *(_OWORD *)&a3->charID.replica.uuid[12];
  *(_OWORD *)(v8 + 24) = *(_OWORD *)a3->charID.replica.uuid;
  *(_OWORD *)(v8 + 36) = v9;
  *((void *)v8 + 1) = a4;
  *((void *)v8 + 2) = a5;
  v10 = [v8 _objCRenameSequence];
  if (v10) {
    +[CRGlobalContextObjC retainObjCSequence:v10];
  }

  return (CRTTMergeableStringRange *)v8;
}

- (void)dealloc
{
  v3 = [(CRTTMergeableStringRange *)self _objCRenameSequence];
  if (v3) {
    +[CRGlobalContextObjC releaseObjCSequence:v3];
  }

  v4.receiver = self;
  v4.super_class = (Class)CRTTMergeableStringRange;
  [(CRTTMergeableStringRange *)&v4 dealloc];
}

- (id)_objCRenameSequence
{
  [(CRTTMergeableStringRange *)self range];
  if (v6)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_alloc_init(ObjCRenameSequence);
    objc_super v4 = TopoReplica::objc(&self->_range.charID.replica);
    -[ObjCRenameSequence addWithReplica:range:](v3, "addWithReplica:range:", v4, self->_range.charID.clock, self->_range.length);
  }
  return v3;
}

- (id)subrangeFrom:(_NSRange)a3
{
  int length = a3.length;
  int location = a3.location;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v6 = [CRTTMergeableStringRange alloc];
  long long v10 = *(_OWORD *)self->_range.charID.replica.uuid;
  int v7 = self->_range.charID.clock + location;
  unsigned int index = self->_range.charID.replica.index;
  int v12 = v7;
  int v13 = length;
  v8 = [(CRTTMergeableStringRange *)v6 initWithTopoIDRange:&v10 renameGeneration:self->_renameGeneration maxCounter:self->_maxCounter];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(CRTTMergeableStringRange *)self range];
    if (v5)
    {
      [v5 range];
      if ((v12 != 0) != (v9 == 0))
      {
LABEL_4:
        [(CRTTMergeableStringRange *)self range];
        if (v5)
        {
          [v5 range];
        }
        else
        {
          v8[0] = 0;
          v8[1] = 0;
          int v10 = 0;
          uint64_t v9 = 0;
        }
        BOOL v6 = TopoIDRange::operator==(uu1, (unsigned __int8 *)v8);
        goto LABEL_11;
      }
    }
    else if (!v12)
    {
      goto LABEL_4;
    }
    BOOL v6 = 1;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v6 = 0;
LABEL_12:

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = TopoID::toString(&self->_range.charID);
  id v5 = [v3 stringWithFormat:@"<CRTTMergeableStringRange %p %@,%d>", self, v4, self->_range.length];

  return v5;
}

- (int64_t)renameGeneration
{
  return self->_renameGeneration;
}

- (void)setRenameGeneration:(int64_t)a3
{
  self->_renameGeneration = a3;
}

- (int64_t)maxCounter
{
  return self->_maxCounter;
}

- (void)setMaxCounter:(int64_t)a3
{
  self->_maxCounter = a3;
}

- (TopoIDRange)range
{
  *(_OWORD *)retstr->charID.replica.uuid = *(_OWORD *)&self->length;
  *(_OWORD *)&retstr->charID.replica.uuid[12] = *(_OWORD *)&self[1].charID.replica.uuid[8];
  return self;
}

- (id).cxx_construct
{
  self->_range.charID.replica.unsigned int index = 0;
  uuid_clear(self->_range.charID.replica.uuid);
  self->_range.charID.clock = 0;
  return self;
}

@end