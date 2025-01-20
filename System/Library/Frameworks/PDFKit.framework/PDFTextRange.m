@interface PDFTextRange
+ (id)textRangeFromSelection:(id)a3;
- (BOOL)isEmpty;
- (id)description;
- (id)end;
- (id)initFromPos:(id)a3 toPos:(id)a4;
- (id)start;
@end

@implementation PDFTextRange

- (BOOL)isEmpty
{
  v3 = [(PDFTextPosition *)self->_end page];
  v4 = [v3 document];

  v5 = [(PDFTextPosition *)self->_end page];
  unint64_t v6 = [v4 indexForPage:v5];

  v7 = [(PDFTextPosition *)self->_start page];
  unint64_t v8 = [v4 indexForPage:v7];

  BOOL v12 = 1;
  if (self->_start)
  {
    end = self->_end;
    if (end && v6 >= v8)
    {
      if (v6 != v8
        || (uint64_t v11 = [(PDFTextPosition *)end offset], v11 > [(PDFTextPosition *)self->_start offset]))
      {
        BOOL v12 = 0;
      }
    }
  }

  return v12;
}

- (id)start
{
  return self->_start;
}

- (id)end
{
  return self->_end;
}

+ (id)textRangeFromSelection:(id)a3
{
  id v3 = a3;
  v4 = [v3 pages];
  v5 = [v4 firstObject];

  unint64_t v6 = -[PDFTextPosition initWithOffset:onPage:]([PDFTextPosition alloc], "initWithOffset:onPage:", [v3 rangeAtIndex:0 onPage:v5], v5);
  v7 = [v3 pages];
  unint64_t v8 = [v7 lastObject];

  uint64_t v9 = objc_msgSend(v3, "rangeAtIndex:onPage:", objc_msgSend(v3, "numberOfTextRangesOnPage:", v8) - 1, v8);
  uint64_t v11 = v10;

  BOOL v12 = [[PDFTextPosition alloc] initWithOffset:v9 + v11 onPage:v8];
  id v13 = [[PDFTextRange alloc] initFromPos:v6 toPos:v12];

  return v13;
}

- (id)initFromPos:(id)a3 toPos:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PDFTextRange;
  unint64_t v8 = [(PDFTextRange *)&v18 init];
  if (v8)
  {
    uint64_t v9 = [v6 page];
    uint64_t v10 = [v9 document];
    uint64_t v11 = [v10 indexForPage:v9];

    BOOL v12 = [v7 page];
    id v13 = [v12 document];
    uint64_t v14 = [v13 indexForPage:v12];

    if (v14 < v11 || v14 == v11 && (uint64_t v15 = [v7 offset], v15 < objc_msgSend(v6, "offset")))
    {
      v16 = v6;
    }
    else
    {
      v16 = v7;
      id v7 = v6;
    }
    id v6 = v7;
    objc_storeStrong((id *)&v8->_start, v7);
    objc_storeStrong((id *)&v8->_end, v16);

    id v7 = v16;
  }

  return v8;
}

- (id)description
{
  id v3 = NSString;
  v4 = [(PDFTextPosition *)self->_start description];
  v5 = [(PDFTextPosition *)self->_end description];
  id v6 = [v3 stringWithFormat:@"Start: \"%@\", End: \"%@\"", v4, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);

  objc_storeStrong((id *)&self->_start, 0);
}

@end