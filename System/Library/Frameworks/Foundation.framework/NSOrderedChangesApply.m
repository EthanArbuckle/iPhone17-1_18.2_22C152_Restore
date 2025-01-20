@interface NSOrderedChangesApply
@end

@implementation NSOrderedChangesApply

uint64_t ___NSOrderedChangesApply_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a2)
  {
    case 2:
      v6 = *(void **)(result + 32);
      result = objc_msgSend(v6, "insertObject:atIndex:", a5);
      break;
    case 3:
      v7 = *(void **)(result + 32);
      result = [v7 removeObjectAtIndex:a4];
      break;
    case 4:
      v8 = *(void **)(result + 32);
      result = [v8 replaceObjectAtIndex:a4 withObject:a5];
      break;
    case 5:
      v9 = *(void **)(result + 32);
      v10 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:");
      result = [v9 moveObjectsAtIndexes:v10 toIndex:a4];
      break;
    default:
      return result;
  }
  return result;
}

@end