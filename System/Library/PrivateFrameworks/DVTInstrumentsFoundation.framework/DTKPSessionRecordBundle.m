@interface DTKPSessionRecordBundle
- (DTTapMemo)memo;
- (NSArray)dataBlocks;
- (void)setDataBlocks:(id)a3;
- (void)setMemo:(id)a3;
@end

@implementation DTKPSessionRecordBundle

- (NSArray)dataBlocks
{
  return self->_dataBlocks;
}

- (void)setDataBlocks:(id)a3
{
}

- (DTTapMemo)memo
{
  return self->_memo;
}

- (void)setMemo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memo, 0);
  objc_storeStrong((id *)&self->_dataBlocks, 0);
}

@end