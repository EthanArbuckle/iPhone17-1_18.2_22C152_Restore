@interface NSIndexPath(BaseBoard)
+ (id)bs_emptyPath;
- (BOOL)bs_hasPrefix:()BaseBoard;
- (id)bs_indexPathByAddingPrefix:()BaseBoard;
- (id)bs_nearestCommonAncestorWithIndexPath:()BaseBoard;
- (id)bs_subpathFromPosition:()BaseBoard;
- (id)bs_subpathWithRange:()BaseBoard;
- (uint64_t)bs_indexPathByRemovingFirstIndex;
@end

@implementation NSIndexPath(BaseBoard)

- (id)bs_subpathFromPosition:()BaseBoard
{
  unint64_t v5 = [a1 length];
  if (v5 <= a3) {
    objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  }
  else {
  v6 = objc_msgSend(a1, "bs_subpathWithRange:", a3, v5 - a3);
  }
  return v6;
}

+ (id)bs_emptyPath
{
  if (qword_1EB21B390 != -1) {
    dispatch_once(&qword_1EB21B390, &__block_literal_global_30);
  }
  v0 = (void *)_MergedGlobals_34;
  return v0;
}

- (id)bs_subpathWithRange:()BaseBoard
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (a3 + a4 > (unint64_t)[a1 length])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"NSIndexPath+BaseBoard.m", 25, @"constraint violation: range.location(%lu) + range.length(%lu) <= self.length(%lu)", a3, a4, objc_msgSend(a1, "length"));

    if (a4) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
LABEL_3:
    v8 = (char *)v12 - ((8 * [a1 length] + 15) & 0xFFFFFFFFFFFFFFF0);
    [a1 getIndexes:v8];
    v9 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:&v8[8 * a3] length:a4];
    goto LABEL_6;
  }
  v9 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
LABEL_6:
  return v9;
}

- (uint64_t)bs_indexPathByRemovingFirstIndex
{
  return objc_msgSend(a1, "bs_subpathFromPosition:", 1);
}

- (id)bs_indexPathByAddingPrefix:()BaseBoard
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  uint64_t v6 = [a1 length] + v5;
  if (v6)
  {
    [v4 getIndexes:(char *)v9 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
    [a1 getIndexes:(char *)&v9[v5] - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
    v7 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:(char *)v9 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0) length:v6];
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  }

  return v7;
}

- (BOOL)bs_hasPrefix:()BaseBoard
{
  id v4 = a3;
  unint64_t v5 = [v4 length];
  if (v5 <= [a1 length])
  {
    if (v5)
    {
      BOOL v6 = 0;
      for (i = 0; i != v5; BOOL v6 = i >= v5)
      {
        uint64_t v8 = [a1 indexAtPosition:i];
        if (v8 != [v4 indexAtPosition:i]) {
          break;
        }
        ++i;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)bs_nearestCommonAncestorWithIndexPath:()BaseBoard
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NSIndexPath+BaseBoard.m", 73, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  unint64_t v6 = [a1 length];
  unint64_t v7 = [v5 length];
  if (!v6 || !v7) {
    goto LABEL_13;
  }
  unint64_t v8 = v6 >= v7 ? v7 : v6;
  v9 = (char *)v15 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  for (uint64_t i = 0; ; ++i)
  {
    uint64_t v11 = [a1 indexAtPosition:i];
    if (v11 != [v5 indexAtPosition:i]) {
      break;
    }
    *(void *)&v9[8 * i] = [a1 indexAtPosition:i];
  }
  if (!i
    || ([MEMORY[0x1E4F28D58] indexPathWithIndexes:v9 length:i],
        (v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_13:
    v12 = objc_msgSend(MEMORY[0x1E4F28D58], "bs_emptyPath");
  }

  return v12;
}

@end