@interface HIDEvent(HIDGameControllerEventPrivate)
- (uint64_t)gameControllerButtonL4;
- (uint64_t)gameControllerButtonM1;
- (uint64_t)gameControllerButtonM2;
- (uint64_t)gameControllerButtonM3;
- (uint64_t)gameControllerButtonM4;
- (uint64_t)gameControllerButtonR4;
- (uint64_t)gameControllerDirectionPadDown;
- (uint64_t)gameControllerDirectionPadLeft;
- (uint64_t)gameControllerDirectionPadRight;
- (uint64_t)gameControllerDirectionPadUp;
- (uint64_t)gameControllerFaceButtonA;
- (uint64_t)gameControllerFaceButtonB;
- (uint64_t)gameControllerFaceButtonX;
- (uint64_t)gameControllerFaceButtonY;
- (uint64_t)gameControllerJoyStickAxisRz;
- (uint64_t)gameControllerJoyStickAxisX;
- (uint64_t)gameControllerJoyStickAxisY;
- (uint64_t)gameControllerJoyStickAxisZ;
- (uint64_t)gameControllerShoulderButtonL1;
- (uint64_t)gameControllerShoulderButtonL2;
- (uint64_t)gameControllerShoulderButtonR1;
- (uint64_t)gameControllerShoulderButtonR2;
- (uint64_t)gameControllerThumbstickButtonLeft;
- (uint64_t)gameControllerThumbstickButtonRight;
- (uint64_t)gameControllerType;
- (uint64_t)setGameControllerButtonL4:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM1:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM2:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM3:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonM4:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerButtonR4:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadDown:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadLeft:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadRight:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerDirectionPadUp:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonA:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonB:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonX:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerFaceButtonY:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisRz:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisX:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisY:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerJoyStickAxisZ:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonL1:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonL2:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonR1:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerShoulderButtonR2:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerThumbstickButtonLeft:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerThumbstickButtonRight:()HIDGameControllerEventPrivate;
- (uint64_t)setGameControllerType:()HIDGameControllerEventPrivate;
@end

@implementation HIDEvent(HIDGameControllerEventPrivate)

- (uint64_t)gameControllerButtonL4
{
  return MEMORY[0x1F40E89F8](a1, 2293779);
}

- (uint64_t)setGameControllerButtonL4:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293779);
}

- (uint64_t)gameControllerButtonM1
{
  return MEMORY[0x1F40E89F8](a1, 2293781);
}

- (uint64_t)setGameControllerButtonM1:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293781);
}

- (uint64_t)gameControllerButtonM2
{
  return MEMORY[0x1F40E89F8](a1, 2293782);
}

- (uint64_t)setGameControllerButtonM2:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293782);
}

- (uint64_t)gameControllerButtonM3
{
  return MEMORY[0x1F40E89F8](a1, 2293783);
}

- (uint64_t)setGameControllerButtonM3:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293783);
}

- (uint64_t)gameControllerButtonM4
{
  return MEMORY[0x1F40E89F8](a1, 2293784);
}

- (uint64_t)setGameControllerButtonM4:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293784);
}

- (uint64_t)gameControllerButtonR4
{
  return MEMORY[0x1F40E89F8](a1, 2293780);
}

- (uint64_t)setGameControllerButtonR4:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293780);
}

- (uint64_t)gameControllerDirectionPadDown
{
  return MEMORY[0x1F40E89F8](a1, 2293762);
}

- (uint64_t)setGameControllerDirectionPadDown:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293762);
}

- (uint64_t)gameControllerDirectionPadLeft
{
  return MEMORY[0x1F40E89F8](a1, 2293763);
}

- (uint64_t)setGameControllerDirectionPadLeft:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293763);
}

- (uint64_t)gameControllerDirectionPadRight
{
  return MEMORY[0x1F40E89F8](a1, 2293764);
}

- (uint64_t)setGameControllerDirectionPadRight:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293764);
}

- (uint64_t)gameControllerDirectionPadUp
{
  return MEMORY[0x1F40E89F8](a1, 2293761);
}

- (uint64_t)setGameControllerDirectionPadUp:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293761);
}

- (uint64_t)gameControllerFaceButtonA
{
  return MEMORY[0x1F40E89F8](a1, 2293765);
}

- (uint64_t)setGameControllerFaceButtonA:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293765);
}

- (uint64_t)gameControllerFaceButtonB
{
  return MEMORY[0x1F40E89F8](a1, 2293766);
}

- (uint64_t)setGameControllerFaceButtonB:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293766);
}

- (uint64_t)gameControllerFaceButtonX
{
  return MEMORY[0x1F40E89F8](a1, 2293767);
}

- (uint64_t)setGameControllerFaceButtonX:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293767);
}

- (uint64_t)gameControllerFaceButtonY
{
  return MEMORY[0x1F40E89F8](a1, 2293768);
}

- (uint64_t)setGameControllerFaceButtonY:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293768);
}

- (uint64_t)gameControllerJoyStickAxisRz
{
  return MEMORY[0x1F40E89F8](a1, 2293776);
}

- (uint64_t)setGameControllerJoyStickAxisRz:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293776);
}

- (uint64_t)gameControllerJoyStickAxisX
{
  return MEMORY[0x1F40E89F8](a1, 2293773);
}

- (uint64_t)setGameControllerJoyStickAxisX:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293773);
}

- (uint64_t)gameControllerJoyStickAxisY
{
  return MEMORY[0x1F40E89F8](a1, 2293774);
}

- (uint64_t)setGameControllerJoyStickAxisY:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293774);
}

- (uint64_t)gameControllerJoyStickAxisZ
{
  return MEMORY[0x1F40E89F8](a1, 2293775);
}

- (uint64_t)setGameControllerJoyStickAxisZ:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293775);
}

- (uint64_t)gameControllerShoulderButtonL1
{
  return MEMORY[0x1F40E89F8](a1, 2293769);
}

- (uint64_t)setGameControllerShoulderButtonL1:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293769);
}

- (uint64_t)gameControllerShoulderButtonL2
{
  return MEMORY[0x1F40E89F8](a1, 2293771);
}

- (uint64_t)setGameControllerShoulderButtonL2:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293771);
}

- (uint64_t)gameControllerShoulderButtonR1
{
  return MEMORY[0x1F40E89F8](a1, 2293770);
}

- (uint64_t)setGameControllerShoulderButtonR1:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293770);
}

- (uint64_t)gameControllerShoulderButtonR2
{
  return MEMORY[0x1F40E89F8](a1, 2293772);
}

- (uint64_t)setGameControllerShoulderButtonR2:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A78](a1, 2293772);
}

- (uint64_t)gameControllerThumbstickButtonLeft
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGameControllerThumbstickButtonLeft:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2293777);
}

- (uint64_t)gameControllerThumbstickButtonRight
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGameControllerThumbstickButtonRight:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2293778);
}

- (uint64_t)gameControllerType
{
  return IOHIDEventGetIntegerValue();
}

- (uint64_t)setGameControllerType:()HIDGameControllerEventPrivate
{
  return MEMORY[0x1F40E8A80](a1, 2293760);
}

@end