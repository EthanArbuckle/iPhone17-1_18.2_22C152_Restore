@interface CHProductionRule
- (BOOL)isTerminal;
- (CHProductionRule)initWithLeftNode:(id)a3 rightNode1:(id)a4 rightNode2:(id)a5;
- (CHProductionRule)initWithLeftNode:(id)a3 rightNode1:(id)a4 rightNode2:(id)a5 probability:(double)a6;
- (CHProductionRule)initWithLeftNode:(id)a3 rightNode:(id)a4;
- (CHProductionRule)initWithLeftNode:(id)a3 rightNode:(id)a4 probability:(double)a5;
- (NSString)leftNode;
- (NSString)rightNode1;
- (NSString)rightNode2;
- (double)probability;
- (id)description;
- (id)key;
- (void)setLeftNode:(id)a3;
- (void)setProbability:(double)a3;
- (void)setRightNode1:(id)a3;
- (void)setRightNode2:(id)a3;
@end

@implementation CHProductionRule

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode:(id)a4
{
  return (CHProductionRule *)objc_msgSend_initWithLeftNode_rightNode_probability_(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5, 1.0);
}

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode:(id)a4 probability:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v16 = objc_msgSend_init(self, v11, v12, v13, v14, v15);
  v17 = (CHProductionRule *)v16;
  if (v16)
  {
    objc_storeStrong((id *)(v16 + 8), a3);
    objc_storeStrong((id *)&v17->_rightNode1, a4);
    v17->_probability = a5;
  }

  return v17;
}

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode1:(id)a4 rightNode2:(id)a5
{
  return (CHProductionRule *)objc_msgSend_initWithLeftNode_rightNode1_rightNode2_probability_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5, 1.0);
}

- (CHProductionRule)initWithLeftNode:(id)a3 rightNode1:(id)a4 rightNode2:(id)a5 probability:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v19 = objc_msgSend_init(self, v14, v15, v16, v17, v18);
  v20 = (CHProductionRule *)v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 8), a3);
    objc_storeStrong((id *)&v20->_rightNode1, a4);
    objc_storeStrong((id *)&v20->_rightNode2, a5);
    v20->_probability = a6;
  }

  return v20;
}

- (BOOL)isTerminal
{
  return self->_rightNode2 == 0;
}

- (id)description
{
  v7 = objc_msgSend_rightNode2(self, a2, v2, v3, v4, v5);

  v8 = NSString;
  uint64_t v14 = objc_msgSend_leftNode(self, v9, v10, v11, v12, v13);
  v25 = objc_msgSend_rightNode1(self, v15, v16, v17, v18, v19);
  if (v7)
  {
    v26 = objc_msgSend_rightNode2(self, v20, v21, v22, v23, v24);
    objc_msgSend_probability(self, v27, v28, v29, v30, v31);
    v37 = objc_msgSend_stringWithFormat_(v8, v32, @"%@ -> %@ %@ %0.3f", v33, v34, v35, v14, v25, v26, v36);
  }
  else
  {
    objc_msgSend_probability(self, v20, v21, v22, v23, v24);
    v37 = objc_msgSend_stringWithFormat_(v8, v38, @"%@ -> %@ %0.3f", v39, v40, v41, v14, v25, v42);
  }

  return v37;
}

- (id)key
{
  v7 = objc_msgSend_rightNode2(self, a2, v2, v3, v4, v5);

  v8 = NSString;
  uint64_t v14 = objc_msgSend_leftNode(self, v9, v10, v11, v12, v13);
  uint64_t v20 = objc_msgSend_rightNode1(self, v15, v16, v17, v18, v19);
  v26 = (void *)v20;
  if (v7)
  {
    v27 = objc_msgSend_rightNode2(self, v21, v22, v23, v24, v25);
    v32 = objc_msgSend_stringWithFormat_(v8, v28, @"%@ -> %@ %@", v29, v30, v31, v14, v26, v27);
  }
  else
  {
    v32 = objc_msgSend_stringWithFormat_(v8, v21, @"%@ -> %@", v23, v24, v25, v14, v20);
  }

  return v32;
}

- (NSString)leftNode
{
  return self->_leftNode;
}

- (void)setLeftNode:(id)a3
{
}

- (NSString)rightNode1
{
  return self->_rightNode1;
}

- (void)setRightNode1:(id)a3
{
}

- (NSString)rightNode2
{
  return self->_rightNode2;
}

- (void)setRightNode2:(id)a3
{
}

- (double)probability
{
  return self->_probability;
}

- (void)setProbability:(double)a3
{
  self->_probability = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNode2, 0);
  objc_storeStrong((id *)&self->_rightNode1, 0);
  objc_storeStrong((id *)&self->_leftNode, 0);
}

@end