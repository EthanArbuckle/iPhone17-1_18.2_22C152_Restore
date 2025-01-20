@interface AVTPoseRoundingBehaviour
@end

@implementation AVTPoseRoundingBehaviour

uint64_t ___AVTPoseRoundingBehaviour_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F087B8] decimalNumberHandlerWithRoundingMode:0 scale:6 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
  uint64_t v1 = _AVTPoseRoundingBehaviour_behavior;
  _AVTPoseRoundingBehaviour_behavior = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end