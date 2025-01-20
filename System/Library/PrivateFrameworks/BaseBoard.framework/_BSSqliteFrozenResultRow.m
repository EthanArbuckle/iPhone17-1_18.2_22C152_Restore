@interface _BSSqliteFrozenResultRow
- (BOOL)isValid;
- (double)doubleAtIndex:(unint64_t)a3;
- (id)dataAtIndex:(unint64_t)a3;
- (id)keyAtIndex:(unint64_t)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)stringAtIndex:(unint64_t)a3;
- (int64_t)integerAtIndex:(unint64_t)a3;
- (unint64_t)count;
@end

@implementation _BSSqliteFrozenResultRow

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)keyAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenColumnNames objectAtIndexedSubscript:a3];
}

- (id)objectAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenObjects objectAtIndexedSubscript:a3];
}

- (int64_t)integerAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_frozenIntegers objectAtIndexedSubscript:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (double)doubleAtIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_frozenDoubles objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (id)stringAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenStrings objectAtIndexedSubscript:a3];
}

- (id)dataAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_frozenDatas objectAtIndexedSubscript:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenDatas, 0);
  objc_storeStrong((id *)&self->_frozenStrings, 0);
  objc_storeStrong((id *)&self->_frozenDoubles, 0);
  objc_storeStrong((id *)&self->_frozenIntegers, 0);
  objc_storeStrong((id *)&self->_frozenObjects, 0);
  objc_storeStrong((id *)&self->_frozenColumnNames, 0);
}

@end