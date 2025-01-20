@interface CPLSimpleRecordView
- (CPLSimpleRecordView)initWithRecord:(id)a3;
- (id)scopedIdentifier;
- (id)synthesizedRecord;
@end

@implementation CPLSimpleRecordView

- (void).cxx_destruct
{
}

- (id)synthesizedRecord
{
  return self->_synthesizedRecord;
}

- (id)scopedIdentifier
{
  return [(CPLRecordChange *)self->_synthesizedRecord scopedIdentifier];
}

- (CPLSimpleRecordView)initWithRecord:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLSimpleRecordView;
  v6 = [(CPLSimpleRecordView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_synthesizedRecord, a3);
  }

  return v7;
}

@end