@interface CHParseTableCell
+ (_NSRange)rangeFromString:(id)a3;
+ (id)stringForRange:(_NSRange)a3;
- (CHNonTerminal)nonTerminal;
- (CHParseTableCell)initWithRange:(_NSRange)a3;
- (CHParseTableCell)leftChild;
- (CHParseTableCell)rightChild;
- (CHParseTree)parseTree;
- (CHProductionRule)rule;
- (CHTerminal)terminal;
- (NSMutableArray)replacedCells;
- (_NSRange)_terminalsRangeRecursive:(id)a3;
- (_NSRange)inputRange;
- (_NSRange)originalRange;
- (_NSRange)terminalsRange;
- (double)probability;
- (id)description;
- (id)initNonTerminal:(id)a3 range:(_NSRange)a4;
- (int64_t)combinations;
- (int64_t)length;
- (int64_t)order;
- (int64_t)terminalsCount;
- (void)setCombinations:(int64_t)a3;
- (void)setInputRange:(_NSRange)a3;
- (void)setLeftChild:(id)a3;
- (void)setNonTerminal:(id)a3;
- (void)setOrder:(int64_t)a3;
- (void)setOriginalRange:(_NSRange)a3;
- (void)setParseTree:(id)a3;
- (void)setProbability:(double)a3;
- (void)setReplacedCells:(id)a3;
- (void)setRightChild:(id)a3;
- (void)setRule:(id)a3;
- (void)setTerminal:(id)a3;
- (void)setTerminalsCount:(int64_t)a3;
- (void)setTerminalsRange:(_NSRange)a3;
@end

@implementation CHParseTableCell

- (CHParseTableCell)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result = (CHParseTableCell *)objc_msgSend_init(self, a2, a3.location, a3.length, v3, v4);
  if (result)
  {
    result->_inputRange.NSUInteger location = location;
    result->_inputRange.NSUInteger length = length;
  }
  return result;
}

- (id)initNonTerminal:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a3;
  uint64_t v14 = objc_msgSend_init(self, v9, v10, v11, v12, v13);
  v15 = (void *)v14;
  if (v14)
  {
    objc_storeStrong((id *)(v14 + 8), a3);
    v15[12] = location;
    v15[13] = length;
  }

  return v15;
}

- (int64_t)length
{
  objc_msgSend_inputRange(self, a2, v2, v3, v4, v5);
  return v6;
}

- (id)description
{
  v7 = NSString;
  id v8 = objc_msgSend_description(self->_nonTerminal, a2, v2, v3, v4, v5);
  NSUInteger location = self->_inputRange.location;
  NSUInteger length = self->_inputRange.length;
  double probability = self->_probability;
  v17 = objc_msgSend_description(self->_rule, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_stringWithFormat_(v7, v18, @"ParseCell: non-terminal='%@' range=[%lu, %lu]' probability=%.6f rule='%@'", v19, v20, v21, v8, location, length + location, *(void *)&probability, v17);

  return v22;
}

+ (id)stringForRange:(_NSRange)a3
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%lu-%lu", a3.length, v3, v4, a3.location, a3.length);
}

+ (_NSRange)rangeFromString:(id)a3
{
  int64_t v6 = objc_msgSend_componentsSeparatedByString_(a3, a2, @"-", v3, v4, v5);
  uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0, v8, v9, v10);
  uint64_t v17 = objc_msgSend_integerValue(v11, v12, v13, v14, v15, v16);
  v22 = objc_msgSend_objectAtIndexedSubscript_(v6, v18, 1, v19, v20, v21);
  uint64_t v28 = objc_msgSend_integerValue(v22, v23, v24, v25, v26, v27);

  NSUInteger v29 = v17;
  NSUInteger v30 = v28;
  result.NSUInteger length = v30;
  result.NSUInteger location = v29;
  return result;
}

- (_NSRange)terminalsRange
{
  v7 = objc_msgSend_nonTerminal(self, a2, v2, v3, v4, v5);
  uint64_t v12 = objc_msgSend__terminalsRangeRecursive_(self, v8, (uint64_t)v7, v9, v10, v11);
  NSUInteger v14 = v13;

  NSUInteger v15 = v12;
  NSUInteger v16 = v14;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (_NSRange)_terminalsRangeRecursive:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_rightNode(v4, v5, v6, v7, v8, v9);

  objc_msgSend_leftNode(v4, v11, v12, v13, v14, v15);
  if (v10) {
    NSUInteger v16 = {;
  }
    NSUInteger v21 = objc_msgSend__terminalsRangeRecursive_(self, v17, (uint64_t)v16, v18, v19, v20);
    NSUInteger v23 = (NSUInteger)v22;
    uint64_t v28 = objc_msgSend_rightNode(v4, v22, v24, v25, v26, v27);
    v47.NSUInteger location = objc_msgSend__terminalsRangeRecursive_(self, v29, (uint64_t)v28, v30, v31, v32);
    v47.NSUInteger length = v33;
    v45.NSUInteger location = v21;
    v45.NSUInteger length = v23;
    NSRange v34 = NSUnionRange(v45, v47);
    NSUInteger location = v34.location;
    NSUInteger length = v34.length;
  }
  else {
    NSUInteger v16 = {;
  }
    NSUInteger location = objc_msgSend_inputRange(v16, v37, v38, v39, v40, v41);
    NSUInteger length = v42;
  }

  NSUInteger v43 = location;
  NSUInteger v44 = length;
  result.NSUInteger length = v44;
  result.NSUInteger location = v43;
  return result;
}

- (CHNonTerminal)nonTerminal
{
  return self->_nonTerminal;
}

- (void)setNonTerminal:(id)a3
{
}

- (_NSRange)inputRange
{
  NSUInteger length = self->_inputRange.length;
  NSUInteger location = self->_inputRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setInputRange:(_NSRange)a3
{
  self->_inputRange = a3;
}

- (void)setTerminalsRange:(_NSRange)a3
{
  self->_terminalsRange = a3;
}

- (_NSRange)originalRange
{
  NSUInteger length = self->_originalRange.length;
  NSUInteger location = self->_originalRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setOriginalRange:(_NSRange)a3
{
  self->_originalRange = a3;
}

- (int64_t)combinations
{
  return self->_combinations;
}

- (void)setCombinations:(int64_t)a3
{
  self->_combinations = a3;
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (int64_t)terminalsCount
{
  return self->_terminalsCount;
}

- (void)setTerminalsCount:(int64_t)a3
{
  self->_terminalsCount = a3;
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_double probability = a3;
}

- (CHProductionRule)rule
{
  return self->_rule;
}

- (void)setRule:(id)a3
{
}

- (CHTerminal)terminal
{
  return self->_terminal;
}

- (void)setTerminal:(id)a3
{
}

- (CHParseTableCell)leftChild
{
  return self->_leftChild;
}

- (void)setLeftChild:(id)a3
{
}

- (CHParseTableCell)rightChild
{
  return self->_rightChild;
}

- (void)setRightChild:(id)a3
{
}

- (CHParseTree)parseTree
{
  return self->_parseTree;
}

- (void)setParseTree:(id)a3
{
}

- (NSMutableArray)replacedCells
{
  return self->_replacedCells;
}

- (void)setReplacedCells:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacedCells, 0);
  objc_storeStrong((id *)&self->_parseTree, 0);
  objc_storeStrong((id *)&self->_rightChild, 0);
  objc_storeStrong((id *)&self->_leftChild, 0);
  objc_storeStrong((id *)&self->_terminal, 0);
  objc_storeStrong((id *)&self->_rule, 0);
  objc_storeStrong((id *)&self->_nonTerminal, 0);
}

@end