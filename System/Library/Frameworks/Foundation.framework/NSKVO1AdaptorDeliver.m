@interface NSKVO1AdaptorDeliver
@end

@implementation NSKVO1AdaptorDeliver

uint64_t ___NSKVO1AdaptorDeliver_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _receiveBox:a2];
}

uint64_t ___NSKVO1AdaptorDeliver_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  switch(*(void *)(result + 56))
  {
    case 1:
      uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(void *)(result + 40)), "objectAtIndex:", a2);
      v5 = *(void **)(v3 + 48);
      result = [v5 updateObject:v4 atIndex:a2];
      break;
    case 2:
      uint64_t v6 = objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(void *)(result + 40)), "objectAtIndex:", a2);
      v7 = *(void **)(v3 + 48);
      result = [v7 insertObject:v6 atIndex:a2];
      break;
    case 3:
      v8 = *(void **)(result + 48);
      result = [v8 removeObjectAtIndex:a2];
      break;
    case 4:
      uint64_t v9 = objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "valueForKeyPath:", *(void *)(result + 40)), "objectAtIndex:", a2);
      v10 = *(void **)(v3 + 48);
      result = [v10 replaceObjectAtIndex:a2 withObject:v9];
      break;
    default:
      return result;
  }
  return result;
}

uint64_t ___NSKVO1AdaptorDeliver_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _receiveBox:a2];
}

@end