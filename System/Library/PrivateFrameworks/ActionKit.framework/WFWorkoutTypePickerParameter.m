@interface WFWorkoutTypePickerParameter
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
@end

@implementation WFWorkoutTypePickerParameter

- (void).cxx_destruct
{
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  unint64_t v4 = +[WFHealthKitHelper workoutActivityTypeFromReadableWorkoutActivityType:v3];

  v5 = (uint64_t (*(*)(uint64_t))())softLinkHKUILocalizedWorkoutTypeName;
  return v5(v4);
}

- (id)possibleStates
{
  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    unint64_t v4 = +[WFHealthKitHelper readableWorkoutActivityTypes];
    objc_msgSend(v4, "if_map:", &__block_literal_global_45634);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __46__WFWorkoutTypePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  unint64_t v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

@end